import 'package:flutter/material.dart';
import 'package:provelop_app/Event/ui/screens/event_background.dart';
import 'package:provelop_app/Event/ui/widgets/event_list.dart';

class EventsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        EventBackground(),
        ListView(
          children: <Widget>[
            EventList(),
          ],
        ),
      ],
    );
  }

}