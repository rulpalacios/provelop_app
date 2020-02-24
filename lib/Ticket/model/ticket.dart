import 'package:flutter/material.dart';
import 'package:provelop_app/Event/model/event.dart';
import 'package:provelop_app/User/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ticket {
  String id;
  String name;
  User userOwner;
  Event eventTicket;
  DocumentReference userOwnerRef;

  Ticket({
    Key key,
    @required this.name,
    this.userOwner,
    this.eventTicket,
    this.userOwnerRef
  });
}