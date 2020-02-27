import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provelop_app/Ticket/ui/widgets/ticket_card.dart';
import 'package:provelop_app/User/model/user.dart';
import 'package:provelop_app/Event/model/event.dart';
import 'package:provelop_app/User/ui/widgets/profile_place.dart';
import 'package:provelop_app/Ticket/model/ticket.dart';
import 'cloud_firestore_api.dart';

class CloudFirestoreRepository{
  final _cloudFirestoreAPI = CloudFirestoreAPI();


  List<ProfilePlace> buildEvents(List<DocumentSnapshot> eventsListSnapshot) => _cloudFirestoreAPI.buildEvents(eventsListSnapshot);
  List<TicketCard> buildTickets(List<DocumentSnapshot> ticketsListSnapshot) => _cloudFirestoreAPI.buildTickets(ticketsListSnapshot);

  Future<dynamic> getUser(DocumentReference userRef) => _cloudFirestoreAPI.getUser(userRef);

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

  Future<void> updateEventData(Event event) => _cloudFirestoreAPI.updateEventData(event);

  Future<void> updateTicketData(Ticket ticket) => _cloudFirestoreAPI.updateTicketData(ticket);
}