import 'package:flutter/material.dart';
import 'package:provelop_app/Place/ui/widgets/description_place.dart';
import 'package:provelop_app/Place/ui/screens/header_appbar.dart';
import 'package:provelop_app/Place/ui/widgets/review_list.dart';
import 'package:provelop_app/widgets/title_header.dart';
import 'package:provelop_app/Event/model/event.dart';

class HomeTrips extends StatelessWidget {
  Event event;

  HomeTrips({
    Key key,
    @required this.event
  });

  String descriptionDummy = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        HeaderAppBar(height: 100.0),
        ListView(
          children: <Widget>[
            DescriptionPlace(
              name: this.event.name,
              description: this.event.description,
              seats: this.event.capacity
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 25.0, left: 5.0),
              child: SizedBox(
                height: 45.0,
                width: 45.0,
                child: IconButton(
                    icon: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 45
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    }
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
                child: TitleHeader(title: ""),
              )
            )
          ],
        ),

      ],
    );
  }

}