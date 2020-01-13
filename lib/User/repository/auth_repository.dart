import 'package:firebase_auth/firebase_auth.dart';
import 'package:provelop_app/User/repository/firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signIn();
  Future<FirebaseUser> signInFacebook() => _firebaseAuthAPI.facebookSignIn();
  Future<FirebaseUser> signInWithEmail(String email, String password) => _firebaseAuthAPI.signInWithEmail(email, password);
  Future<FirebaseUser> signUp(String email, String password, String username) => _firebaseAuthAPI.signUp(email, password, username);

  resetPassword(String email) => _firebaseAuthAPI.resetPassword(email);
  signOut() => _firebaseAuthAPI.signOut();

}