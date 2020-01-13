import 'package:flutter/material.dart';
import 'package:provelop_app/User/ui/widgets/profile_place.dart';
import 'package:provelop_app/Place/model/place.dart';

class EventList extends StatelessWidget {

  Place place = new Place('Aprende italiano, aleman o frances', 'Plaza Comercial Solesta', '', 'Sat, Jan 11 - 4:00PM');
  Place place2 = new Place('1er Simposium Internacional', 'Hilton Garden Inn Puebla', '', 'Fri, Jan 24 - 4:00PM');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 150.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child: Column(
        children: <Widget>[
          ProfilePlace('assets/img/river.jpeg', place),
          ProfilePlace('assets/img/mountain.jpeg', place2),
        ],
      ),
    );
  }

}