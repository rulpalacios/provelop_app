import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provelop_app/User/bloc/bloc_user.dart';

class TicketList extends StatelessWidget {
  UserBloc userBloc;
  
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
          top: 150.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child: StreamBuilder(
          stream: userBloc.myTicketsList("AOj0881cvaM9Oo4rXCHe8Bvy2TI3"),
          builder: (context, AsyncSnapshot snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.done:
                return Column(
                  children: userBloc.buildTickets(snapshot.data.documents)
                );
              case ConnectionState.active:
                return Column(
                    children: userBloc.buildTickets(snapshot.data.documents)
                );

              case ConnectionState.none:
                return CircularProgressIndicator();
              default:
                return Column(
                    children: userBloc.buildTickets(snapshot.data.documents)
                );
            }
          }
      ),
    );
  }
} 