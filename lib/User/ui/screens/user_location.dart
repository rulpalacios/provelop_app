import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapLocation extends StatefulWidget{
  @override
  State<MapLocation> createState() => MapLocationState();
}

class MapLocationState extends State<MapLocation> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _googleMapController;
  Position position;
  Widget _child;

  @override
  void initState(){
    //_child = InkRipple("Getting Location");
    getCurrentLocation();
    super.initState();
  }

  void getCurrentLocation() async{
    Position _position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(_position.latitude);
    print(_position.longitude);
    setState(() {
      position = _position;
    });
  }
  Set<Marker> _createMarker(){
    return <Marker>[
      Marker(
        markerId: MarkerId("currentLocation"),
        position: LatLng(position.latitude, position.longitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: "Current")
      )
    ] .toSet();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: _createMarker(),
        initialCameraPosition: CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 12.0
        ),
        onMapCreated: (GoogleMapController controller){
          _googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getCurrentLocation,
        child: Icon(Icons.my_location),
      )
    );
  }


}