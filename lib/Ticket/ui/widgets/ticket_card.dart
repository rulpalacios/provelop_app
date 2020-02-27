import 'package:flutter/material.dart';
import 'package:provelop_app/Ticket/model/ticket.dart';

class TicketCard extends StatelessWidget {
  Ticket ticket;

  TicketCard(this.ticket);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
          top: 10.0,
          bottom: 70.0
      ),
      height: 180,
      child: Text(this.ticket.name),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.grey,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
    );
  }
}