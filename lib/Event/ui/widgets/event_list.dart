import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provelop_app/Place/model/place.dart';
import 'package:provelop_app/User/bloc/bloc_user.dart';

class EventList extends StatelessWidget {
  UserBloc userBloc;

  Place place = new Place('Aprende italiano, aleman o frances', 'Plaza Comercial Solesta', '', 'Sat, Jan 11 - 4:00PM');
  Place place2 = new Place('1er Simposium Internacional', 'Hilton Garden Inn Puebla', '', 'Fri, Jan 24 - 4:00PM');

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      margin: EdgeInsets.only(
          top: 150.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child: StreamBuilder(
          stream: userBloc.eventsStream,
          builder: (context, AsyncSnapshot snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.done:
                return Column(
//                  children: eventBloc.buildEvents(snapshot.data.documents)
                children: userBloc.buildEvents(snapshot.data.documents)
                );
              case ConnectionState.active:
                return Column(
                    children: userBloc.buildEvents(snapshot.data.documents)
                );

              case ConnectionState.none:
                return CircularProgressIndicator();
              default:
                return Column(
                    children: userBloc.buildEvents(snapshot.data.documents)
                );
            }
          }
      ),
    );
  }

}