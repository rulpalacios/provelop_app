import 'package:flutter/material.dart';
import 'package:provelop_app/User/model/user.dart';

class Event{
  String id;
  String name;
  String description;
  int capacity;
  int availableSeats;
  User userOwner;

  Event({
    Key key,
    @required this.name,
    @required this.description,
    @required this.capacity,
    this.availableSeats,
    @required this.userOwner
  });
}