import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provelop_app/User/model/user.dart';
import 'package:provelop_app/Event/model/event.dart';
import 'package:provelop_app/User/repository/auth_repository.dart';
import 'package:provelop_app/User/repository/cloud_firestore_api.dart';
import 'package:provelop_app/User/repository/cloud_firestore_repository.dart';
import 'package:provelop_app/User/ui/widgets/profile_place.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  Stream<QuerySnapshot> eventsListStream = Firestore.instance.collection(CloudFirestoreAPI().events).snapshots();
  Stream<QuerySnapshot> get eventsStream => eventsListStream;
  List<ProfilePlace> buildEvents(List<DocumentSnapshot> eventsListSnapshot) => _cloudFirestoreRepository.buildEvents(eventsListSnapshot);

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

  Future<void> updateEventData(Event event) => _cloudFirestoreRepository.updateEventData(event);

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