import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapsDemo extends StatefulWidget {
  static const String routeName = '/date';

  @override
  _MapsDemoState createState() => _MapsDemoState();
}

class _MapsDemoState extends State<MapsDemo> {
 

  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(8.984471, -79.531234);
  final Set<Marker> _marker = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;


  _onMapCreated(GoogleMapController controller){
_controller.complete(controller);
}

_onCameraMove(CameraPosition position){
  _lastMapPosition = position.target;
}

_onMapTypeButtonPressed(){
 setState(() {
   _currentMapType = _currentMapType == MapType.normal 
   ? MapType.satellite
   : MapType.normal;
 });

}

_onAddMarkerButtonPressed(){
 setState(() {
   _marker.add(Marker(
     markerId: MarkerId(_lastMapPosition.toString()),
     position: _lastMapPosition,
     infoWindow: InfoWindow(
       title: 'this is a Title',
       snippet: 'This is a snippert',
     ),
     icon: BitmapDescriptor.defaultMarker,
   )
   );
 });

}


Widget button(Function function, IconData icon){
  return FloatingActionButton(
    onPressed: function,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    backgroundColor: Colors.blue,
    child: Icon(
      icon,
      size: 36.0,
      ),

  );


}

@override
Widget build(BuildContext context) {
    return  Scaffold(
         appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.grey[800],
      ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 16.7946,
                ),
                mapType: _currentMapType,
                markers: _marker,
                onCameraMove: _onCameraMove,
            ),
            // Padding(
            //   padding: EdgeInsets.all(16.0),
            //   child: Align(
            //     alignment: Alignment.topRight,
            //     child: Column(
            //       children: <Widget>[
            //         button(_onMapTypeButtonPressed, Icons.map),
            //         SizedBox(height: 16.0,),
            //         button(_onAddMarkerButtonPressed, Icons.add_location),

            //       ],
            //     ),

            //   ),

            // ),

          ],

        )

        );
        
       

    

  }
}





