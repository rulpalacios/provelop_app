import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provelop_app/User/model/user.dart';
import 'package:provelop_app/User/repository/auth_repository.dart';
import 'package:provelop_app/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();
  // Flujo de datos - Stream
  // Stream - Firebase
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;
  // Casos de uso
  // SignIn con Google
  Future<FirebaseUser> signIn(){
    return _auth_repository.signInFirebase();
  }
  // Casos de uso
  // SignIn con Facebook
  Future<FirebaseUser> signInWithFacebook(){
    return _auth_repository.signInFacebook();
  }
  // SignIn con Email
  Future<FirebaseUser> signInWithEmail(String email, String password){
    return _auth_repository.signInWithEmail(email, password);
  }
  // SignUp con Email
  Future<FirebaseUser> signUp(String email, String password, String username){
    return _auth_repository.signUp(email, password, username);
  }
  // SignUp user in DB
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  // Reset password
  resetPassword(String email){
    return _auth_repository.resetPassword(email);
  }
  signOut(){
    _auth_repository.signOut();
  }

  @override
  void dispose(){

  }
}