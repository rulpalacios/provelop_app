import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provelop_app/Place/ui/screens/home_trips.dart';
import 'package:provelop_app/User/bloc/bloc_user.dart';
import 'package:provelop_app/User/ui/screens/profile_trips.dart';
import 'package:provelop_app/Event/ui/screens/events_home.dart';
import 'package:provelop_app/Ticket/ui/screens/tickets.dart';

class PlatziTripsCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.indigo),
                  title: Text("")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_activity, color: Colors.indigo),
                  title: Text("")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.indigo),
                  title: Text("")
              ),
            ]
        ),


        tabBuilder: (BuildContext context, int index) {

          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => EventsHome(),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => Tickets(),
              );
              break;
            case 2:
              return CupertinoTabView(
                  builder: (BuildContext context){
                    //=> ProfileTrips(),
                    return BlocProvider<UserBloc>(
                      bloc: UserBloc(),
                      child: ProfileTrips(),
                    );
                  }
              );
              break;

          }

        },
      ),
    );
  }

}