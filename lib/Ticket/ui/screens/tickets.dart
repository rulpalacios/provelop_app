import 'package:flutter/material.dart';
import 'package:provelop_app/Ticket/ui/widgets/ticket_card.dart';
import 'package:provelop_app/Ticket/ui/widgets/ticket_list.dart';

class Tickets extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        TicketList()
      ],
    );
  }
}

//<Widget>[
//HeaderAppBar(height: 100.0),
//ListView(
//children: <Widget>[
//DescriptionPlace(
//name: this.event.name,
//description: this.event.description,
//seats: this.event.capacity,
//ownerRef: this.event.userOwnerRef,
//),
//],
//),