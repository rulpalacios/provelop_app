import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMap extends StatelessWidget {
  final double latitude = 19.0421108;
  final double longitude = -98.1949433;
  GoogleMapController _googleMapController;

//  LocationMap({
//    Key key,
//    @required this.latitude,
//    @required this.longitude
//  });

  Set<Marker> _createMarker(){
    return <Marker>[
      Marker(
          markerId: MarkerId("currentLocation"),
          position: LatLng(this.latitude, this.longitude),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: "Event")
      )
    ] .toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: _createMarker(),
        initialCameraPosition: CameraPosition(
            target: LatLng(this.latitude, this.longitude),
            zoom: 12.0
        ),
        onMapCreated: (GoogleMapController controller){
          _googleMapController = controller;
        },
      ),
    );
  }
}