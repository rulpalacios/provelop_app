import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provelop_app/Ticket/ui/widgets/ticket_card.dart';
import 'package:provelop_app/Ticket/ui/widgets/ticket_list.dart';
import 'package:provelop_app/User/bloc/bloc_user.dart';
import 'package:provelop_app/User/model/user.dart';

class Tickets extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showUserTickets(snapshot);
          case ConnectionState.done:
            return showUserTickets(snapshot);
          default:
        }
      },
    );
  }
    Widget showUserTickets(AsyncSnapshot snapshot){
      if(!snapshot.hasData || snapshot.hasError){
        print("No logeado");
        return Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Text("Usuario no logeado. Haz Login")

              ],
            ),
          ],
        );
      }else {
        var user = User(
            uid: snapshot.data.uid,
            name: snapshot.data.displayName,
            email: snapshot.data.email,
            photoURL: snapshot.data.photoUrl
        );

        return ListView(
          children: <Widget>[
            TicketList(user)
          ],
        );
      }
    }

  }