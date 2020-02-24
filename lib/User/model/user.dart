import 'package:flutter/material.dart';
import 'package:provelop_app/Event/model/event.dart';
import 'package:provelop_app/Ticket/model/ticket.dart';

class User{
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final List<Event> myEvents;
  final List<Ticket> myTickets;

  User({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoURL,
    this.myEvents,
    this.myTickets
  });
}