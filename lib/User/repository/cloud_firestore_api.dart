import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provelop_app/User/model/user.dart';
import 'package:provelop_app/Event/model/event.dart';

class CloudFirestoreAPI{
  final String users = 'users';
  final String events = 'events';

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void updateUserData(User user) async {
    DocumentReference reference = _db.collection(users).document(user.uid);

    return reference.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myEvents': user.myEvents,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }

  Future<void> updateEventData(Event event) async {
    CollectionReference reference = _db.collection(events);

    await _auth.currentUser().then((FirebaseUser user) {
      reference.add({
        'name': event.name,
        'description': 'Evento Provelop',
        'capacity': 25,
        'userOwner': "${users}/${user.uid}"
      });
    });
  }

}