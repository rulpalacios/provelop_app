import 'package:flutter/material.dart';
import 'package:provelop_app/Event/model/event.dart';
import 'package:provelop_app/Place/model/place.dart';
import 'package:provelop_app/widgets/floating_action_button_green.dart';
import 'package:provelop_app/Place/ui/screens/home_trips.dart';

class ProfilePlaceInfo extends StatelessWidget {

  Event event;

  ProfilePlaceInfo(this.event);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final place = Text(
      this.event.name,
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 20.0,
          fontWeight: FontWeight.bold
      ),
    );

    final placeInfo = Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10.0
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.event.name,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    fontFamily: 'Lato',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold
                ),
              )
            ]
        )
    );

    final seats = RichText(text: TextSpan(
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.amber
      ),
      children: [
        WidgetSpan(
          child: Icon(
            Icons.event_seat, 
            size: 20.0,
            color: Colors.amber,
          )
        ),
        TextSpan(text: '${this.event.capacity}')
      ]
    ));
    final steps = Text(
      //  child: Icon(
      //   Icons.favorite_border
      // ),
      '${this.event.capacity}',
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.amber
      ),
    );

    final card = Container(
      width: screenWidth * 0.65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
      child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              place,
              // placeInfo,
              seats
            ],
          )
      ),
    );

    return Stack(
      alignment: Alignment(0.8, 1.25),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
          onViewEvent: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HomeTrips(event: this.event)
                )
            );
          },
        )
      ],
    );
  }

}