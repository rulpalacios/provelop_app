import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provelop_app/User/model/user.dart';
import 'package:provelop_app/Event/model/event.dart';
import 'cloud_firestore_api.dart';

class CloudFirestoreRepository{
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

  Future<void> updateEventData(Event event) => _cloudFirestoreAPI.updateEventData(event);
}