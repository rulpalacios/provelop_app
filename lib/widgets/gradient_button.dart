import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  double width = 0.0;
  double height = 0.0;
  Color fromColor = Color(0xFFa7ff84);
  Color toColor = Color(0xFF1cbb78);


  GradientButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.height,
    this.width,
    this.fromColor,
    this.toColor
  });

  @override 
  State createState(){
    return _GradientButton();
  }
}

class _GradientButton extends State<GradientButton>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(
            top: 30.0,
            left: 20.0,
            right: 20.0
        ),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
                colors: [
                  widget.fromColor,//arriba
                  widget.toColor//bajo
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp

            )

        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Lato",
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),

          ),
        ),
      ),
    );
  }
}