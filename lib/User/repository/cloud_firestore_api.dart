import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provelop_app/User/model/user.dart';
import 'package:provelop_app/Event/model/event.dart';
import 'package:provelop_app/User/ui/widgets/profile_place.dart';

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

  Future<dynamic> getUser(DocumentReference user) async{
    DocumentSnapshot userRef = await user.get();

    return userRef;
  }

  Future<void> updateEventData(Event event) async {
    CollectionReference reference = _db.collection(events);

    await _auth.currentUser().then((FirebaseUser user) {
      reference.add({
        'name': event.name,
        'description': event.description,
        'capacity': event.capacity,
//        'userOwner': "${users}/${user.uid}"
        'userOwner': _db.document("${users}/${user.uid}")
      }).then((DocumentReference docReference){
        docReference.get().then((DocumentSnapshot snapshot){
          DocumentReference userReference = _db.collection(users).document(user.uid);
          userReference.updateData({
            'myEvents': FieldValue.arrayUnion([_db.document("${events}/${snapshot.documentID}")])
          });
        });
      });
    });
  }

  List<ProfilePlace> buildEvents(List<DocumentSnapshot> eventsListSnapshot){
    List<ProfilePlace> eventList = List<ProfilePlace>();

    eventsListSnapshot.forEach((event){
      eventList.add(ProfilePlace(
          Event(
              name: event.data['name'],
              description: event.data['description'],
              capacity: event.data['capacity'],
              userOwnerRef: event.data['userOwner']
          )
      ));
    });

    return eventList;
  }


}