import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provelop_app/Ticket/ui/widgets/ticket_card.dart';
import 'package:provelop_app/User/model/user.dart';
import 'package:provelop_app/Event/model/event.dart';
import 'package:provelop_app/User/repository/auth_repository.dart';
import 'package:provelop_app/User/repository/cloud_firestore_api.dart';
import 'package:provelop_app/User/repository/cloud_firestore_repository.dart';
import 'package:provelop_app/User/ui/widgets/profile_place.dart';
import 'package:provelop_app/Ticket/model/ticket.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  Stream<QuerySnapshot> eventsListStream = Firestore.instance.collection(CloudFirestoreAPI().events).snapshots();
  Stream<QuerySnapshot> get eventsStream => eventsListStream;
  List<ProfilePlace> buildEvents(List<DocumentSnapshot> eventsListSnapshot) => _cloudFirestoreRepository.buildEvents(eventsListSnapshot);
  List<TicketCard> buildTickets(List<DocumentSnapshot> ticketsListSnapshot) => _cloudFirestoreRepository.buildTickets(ticketsListSnapshot);

  Stream<QuerySnapshot> myTicketsList(String uid) => 
    Firestore.instance.collection(CloudFirestoreAPI().tickets)
      .where("userOwner", isEqualTo: Firestore.instance.document("${CloudFirestoreAPI().users}/${uid}"))
      .snapshots();

  Future<dynamic> getUser(DocumentReference userRef) => _cloudFirestoreRepository.getUser(userRef);
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
// Update UserData
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
// UpdateEventData
  Future<void> updateEventData(Event event) => _cloudFirestoreRepository.updateEventData(event);
// Update TicketData
  Future<void> updateTicketData(Ticket ticket) => _cloudFirestoreRepository.updateTicketData(ticket);
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