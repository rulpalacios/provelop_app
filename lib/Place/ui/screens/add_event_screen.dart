import 'package:flutter/material.dart';
import 'package:provelop_app/widgets/gradient_back.dart';
import 'package:provelop_app/widgets/text_input.dart';
import 'package:provelop_app/widgets/title_header.dart';
class AddEventScreen extends StatefulWidget{
  @override
  State createState(){
    return _AddEventScreen();
  }
}

class _AddEventScreen extends State<AddEventScreen>{
  @override
  Widget build(BuildContext context){

    final _controllerTitleEvent = TextEditingController();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: 300.0),
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
                  child: TitleHeader(title: "Add new event"),
                )
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                    hintText: 'Titulo',
                    inputType: null,
                    maxLines: 1,
                    controller: _controllerTitleEvent,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}