import 'package:flutter/material.dart';
import 'package:provelop_app/widgets/button_purple.dart';

class DescriptionPlace extends StatelessWidget {

  String name;
  String description;
  int seats;

  DescriptionPlace({
    Key key,
    this.name,
    this.description,
    this.seats
  });
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
print(this.seats);
    final star_half = Container (
      margin: EdgeInsets.only(
          top: 353.0,
          right: 3.0
      ),

      child: Icon(
        Icons.star_half,
        color:  Color(0xFFf2C611),
      ),
    );

    final star_border = Container (
      margin: EdgeInsets.only(
          top: 353.0,
          right: 3.0
      ),

      child: Icon(
        Icons.star_border,
        color:  Color(0xFFf2C611),
      ),
    );

    final star = Container (
      margin: EdgeInsets.only(
        top: 353.0,
        right: 3.0
      ),

      child: Icon(
        Icons.star,
        color:  Color(0xFFf2C611),
      ),
    );

    final title = Container (
          margin: EdgeInsets.only(
            top: 150.0,
            left: 20.0,
            right: 20.0
          ),

          child: Text(
            this.name,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 30.0,
              fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,
          ),

    );
    final features = Container(
        margin: EdgeInsets.only(
            top: 10.0,
            left: 20.0,
            right: 20.0
        ),
      child: RichText(
          text: TextSpan(
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
                size: 30.0,
                color: Colors.amber,
              )
            ),
            TextSpan(text: '${this.seats}')
          ]
        ) 
      )
    );

    final descriptionW = Container(
      margin: new EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0

      ),
      child: new Text(
        this.description,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)
        ),

      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title,
        features,
        descriptionW,
        ButtonPurple(buttonText: "Conseguir lugares", onPressed: (){})
      ],
    );


  }

}