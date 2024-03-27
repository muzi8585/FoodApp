import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapS extends StatefulWidget {
  const MapS({super.key});

  @override
  State<MapS> createState() => _MapSState();
}

class _MapSState extends State<MapS> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGoogle = CameraPosition(
      target: LatLng(32.1877, 74.1945), zoom: 14.4746);
  final List<Marker> _markers = <Marker>[
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(32.1877, 74.1945),
      infoWindow: InfoWindow(title: "My Position"),
    )
  ];

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nearby Shop"),backgroundColor: Colors.black,),
      body: Container(
        child: SafeArea(
          child: GoogleMap(
            initialCameraPosition: _kGoogle,
            markers: Set<Marker>.of(_markers),
            mapType: MapType.normal,
            myLocationEnabled: true,
            compassEnabled: true,
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        getUserCurrentLocation().then((value)async{
          print(value.latitude.toString()+""+value.longitude.toString());
          _markers.add(Marker(markerId: MarkerId('2'),position: LatLng(value.latitude,value.longitude),infoWindow: InfoWindow(title: "MyCurrent Location")),);
          CameraPosition cameraPosition=new CameraPosition(target: LatLng(value.latitude,value.longitude),zoom: 15);
          final GoogleMapController controller = _controller.future as GoogleMapController;
          controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition),
          );setState(() {
          });
        });
      },child: Icon(Icons.local_activity,color: Colors.grey,),backgroundColor: Colors.black54,shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      ),
    );
  }
}
class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
   State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
   String _latitude="";
  String _longitde="";
   Future<void> FecthCurrentPosition() async{
   try{
  Position currentpostion=await Geolocator.getCurrentPosition(
   desiredAccuracy: LocationAccuracy.high,
  );
  setState(() {
  _latitude='latitude: ${currentpostion.latitude}';
  _longitde='longitude: ${currentpostion.longitude}';
  });
 }catch(error){
  print("Error is $error");
   }
   }
 @override
 Widget build(BuildContext context) {
   return Scaffold(

   );
   }
}