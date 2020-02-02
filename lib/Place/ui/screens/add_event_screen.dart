import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provelop_app/Event/model/event.dart';
import 'package:provelop_app/User/bloc/bloc_user.dart';
import 'package:provelop_app/widgets/button_purple.dart';
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
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    final _controllerTitleEvent = TextEditingController();
    final _controllerSeatsEvent = TextEditingController();
    final _controllerDescriptionEvent = TextEditingController();

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
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                    hintText: 'Asientos',
                    inputType: null,
                    maxLines: 1,
                    controller: _controllerSeatsEvent,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                    hintText: 'Descripción',
                    inputType: null,
                    maxLines: 5,
                    controller: _controllerDescriptionEvent,
                  ),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: 'Add Event',
                    onPressed: () {
                      //Insertar objeto evento
                      userBloc.updateEventData(Event(
                        name: _controllerTitleEvent.text,
                        description: _controllerDescriptionEvent.text,
                        capacity: int.parse(_controllerSeatsEvent.text),
                      )).whenComplete((){
                        print('creado');
                        Navigator.pop(context);
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}