import 'package:flutter/material.dart';
import 'package:provelop_app/Place/ui/screens/header_appbar.dart';
import 'package:provelop_app/widgets/gradient_back.dart';
import 'package:provelop_app/widgets/title_header.dart';

class CreatorProfile extends StatelessWidget {
  final String username;
  final String photoURL;

  CreatorProfile({
    Key key,
    @required this.username,
    @required this.photoURL
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack(height: 400.0),
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
        Container(
          width: 120.0,
          height: 120.0,
          margin: EdgeInsets.only(
            top: 90.0, left: 150.0,
          ),
          child: CircleAvatar(
            backgroundImage: NetworkImage(this.photoURL != null ? this.photoURL : ""),
          ),
        ),
        Container(
            margin: EdgeInsets.only(
              top: 240.0, left: 140.0,
            ),
          child: Text(
              this.username,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Lato',
              )
          )
        )
      ],
    );
  }
}