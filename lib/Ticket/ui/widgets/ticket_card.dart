import 'package:flutter/material.dart';
import 'package:provelop_app/Ticket/model/ticket.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketCard extends StatelessWidget {
  Ticket ticket;

  TicketCard(this.ticket);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
          top: 10.0,
          bottom: 30.0
      ),
      height: 180,
      child: Row(
        children: <Widget>[
          QrImage(
            data: this.ticket.name,
            version: QrVersions.auto,
            size: 100.0,
          ),
          Text(this.ticket.name),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.white,
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