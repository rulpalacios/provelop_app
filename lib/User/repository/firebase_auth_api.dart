
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FirebaseAuthAPI {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FacebookLogin facebookLogin = FacebookLogin();

  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    AuthResult authResult = await _auth.signInWithCredential(
        GoogleAuthProvider.getCredential(idToken: gSA.idToken, accessToken: gSA.accessToken));

    return authResult.user;
  }

  Future<FirebaseUser> facebookSignIn() async {
//    final result = await facebookLogin.logInWithReadPermissions(['email']);

     final result = await facebookLogin.logIn(['email']);
    // facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    switch(result.status){
      case FacebookLoginStatus.loggedIn:
        AuthResult authResult = await _auth.signInWithCredential(
          FacebookAuthProvider.getCredential(accessToken: result.accessToken.token)
        );
        return  authResult.user;
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("cancelado por usuario");
        break;
      case FacebookLoginStatus.error:
        print("Error: "+result.errorMessage.toString());
        break;
    }
  }

  Future<FirebaseUser> signInWithEmail(String email, String password) async {
    AuthResult authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return authResult.user;
  }
  
  Future<FirebaseUser> signUp(String email, String password, String username) async {
    AuthResult authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    userUpdateInfo.displayName = username;
    userUpdateInfo.photoUrl = "https://api.adorable.io/avatars/285/abott@adorable.png";
    authResult.user.updateProfile(userUpdateInfo);
    
    return authResult.user;
  }

  resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
    print("se enviara un codigo de recuperación");
  }

  signOut() async {
    await _auth.signOut().then((onValue) => print("sesion cerrada"));
    googleSignIn.signOut();
    facebookLogin.logOut();
    print("sesiones cerradas");
  }

}