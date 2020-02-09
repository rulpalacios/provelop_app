import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provelop_app/Place/ui/widgets/location_map.dart';
import 'package:provelop_app/User/bloc/bloc_user.dart';
import 'package:provelop_app/User/ui/screens/creator_profile.dart';
import 'package:provelop_app/widgets/button_purple.dart';
import 'package:map_launcher/map_launcher.dart';

class DescriptionPlace extends StatelessWidget {
//  User ownerUser;
  UserBloc userBloc;
  String name;
  String description;
  int seats;
  DocumentReference ownerRef;

  DescriptionPlace({
    Key key,
    this.name,
    this.description,
    this.seats,
    this.ownerRef
  });
  
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    // TODO: implement build
//    print(this.ownerUser.name);
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
      child: Row(
        children: <Widget>[
          RichText(
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
          ),
          FutureBuilder(
            future: userBloc.getUser(this.ownerRef),
            builder: (BuildContext context, AsyncSnapshot<dynamic> user){
              return Container(
                margin: EdgeInsets.only(
                    left: 20.0,
                ),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.data['photoURL'] != null ? user.data['photoURL'] : ""),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: InkWell(
                        child: Text(user.data['name']),
                        onTap: (){
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (BuildContext context) => HomeTrips(event: this.event)
//                              )
//                          );
                          Navigator.push(context, MaterialPageRoute(
                            builder: (BuildContext context) => CreatorProfile(
                              username: user.data['name'],
                              photoURL: user.data['photoURL'],
                            )
                          ));
                          print("enviando a profile");
                        },
                      ),
//                      child: Text(user.data['name']),
                    )

                  ],
                ),
//              child:
              );
            },
          )

        ],
      ),
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

    openMapsSheet(context) async {
      try {
        final title = "Workosfera";
        final description = "Co-Workin Place";
        final coords = Coords(19.0421108, -98.1949433);
        final availableMaps = await MapLauncher.installedMaps;

        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: SingleChildScrollView(
                  child: Container(
                      child: Wrap(
                          children: <Widget>[
                            for (var map in availableMaps)
                              ListTile(
                                onTap: () => map.showMarker(
                                  coords: coords,
                                  title: title,
                                  description: description,
                                ),
                              title: Text(map.mapName),
                              leading: Image(
                                image: map.icon,
                                height: 30.0,
                                width: 30.0,
                              ),
                            ),
                          ],
                      ),
                  ),
              ),
            );
          },
        );
      } catch (e) {
        print(e);
      }
    }

    final openMaps = Container(
      child: Center(child: Builder(
        builder: (context) {
          return MaterialButton(
            onPressed: () => openMapsSheet(context),
            child: Text('Llegar con'),
          );
        },
      )),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title,
        features,
        descriptionW,
        Container(
          margin: EdgeInsets.only(
            top: 30.0,
          ),
          height: 200.0,

          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                    '¿Cómo llegar?',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: "Lato",
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                    ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 50.0,
                ),
                child: LocationMap()
              )
            ],
          ),
        ),
        openMaps,
        ButtonPurple(buttonText: "Conseguir lugares", onPressed: (){})
      ],
    );


  }

}