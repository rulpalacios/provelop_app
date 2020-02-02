import 'package:flutter/material.dart';


class FloatingActionButtonGreen extends StatefulWidget {
  final VoidCallback onViewEvent;


  FloatingActionButtonGreen({
    Key key,
    @required this.onViewEvent
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }

}


class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: (){
        widget.onViewEvent();
      },
      child: Icon(
        Icons.keyboard_arrow_right
      ),
      heroTag: null,
    );
  }

}