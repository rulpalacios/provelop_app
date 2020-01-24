import 'package:flutter/material.dart';
import 'package:provelop_app/Event/model/event.dart';

class User{
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final List<Event> myEvents;

  User({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoURL,
    this.myEvents
  });
}