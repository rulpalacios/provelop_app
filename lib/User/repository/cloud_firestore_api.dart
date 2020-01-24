import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provelop_app/User/model/user.dart';

class CloudFirestoreAPI{
  final String users = 'users';
  final String events = 'events';

  final Firestore _db = Firestore.instance;

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

}