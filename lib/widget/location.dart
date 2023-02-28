// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class location1 extends StatefulWidget {
//   const location1({Key? key}) : super(key: key);
//
//   @override
//   State<location1> createState() => _location1State();
// }
//
// class _location1State extends State<location1> {
//   GoogleMapController? _controller;
//   Location currentLocation = Location();
//   Set<Marker> _markers={};
//   void getLocation() async{
//     // await FirebaseFirestore.instance.collection("Location").doc("5hGxSAVPSPwgIMcNGRxM").get().then((document) async{
//     //   var icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 3.2),"img/img11.png");
//     //   setState(() {
//     //     this.icon = icon;
//     //   });
//     //   setState(() {
//     //     _markers.add(Marker(markerId: MarkerId('Home'),
//     //         icon: icon,
//     //         position: LatLng(double.parse(document["lattitude"]),double.parse(document["longtitude"]))
//     //     ));
//     //   });
//     // });
//
//     var icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 3.2),"img/img11.png");
//     setState(() {
//       // this.icon = icon;
//     });
//     var location = await currentLocation.getLocation();
//     currentLocation.onLocationChanged.listen((LocationData loc){
//       _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
//         target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
//         zoom: 12.0,
//       )));
//       print(loc.latitude);
//       print(loc.longitude);
//       setState(() {
//        _markers.add(Marker(markerId: MarkerId('Home'),
//             icon: icon,
//             position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
//         ));
//        _markers.add(Marker(markerId: MarkerId('Adajan'),
//            icon: icon,
//            position: LatLng(21.1959,72.7933)
//        ));
//        _markers.add(Marker(markerId: MarkerId('Rander'),
//            icon: icon,
//            position: LatLng(21.2189,72.7961)
//        ));
//       });
//     });
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body:GoogleMap(
//         mapType: MapType.normal,
//           initialCameraPosition: CameraPosition(
//             target: LatLng(21.1702,72.8311),
//             zoom: 14.4746,
//           ),
//         onMapCreated: (GoogleMapController controller) {
//           _controller = controller;
//           getLocation();
//
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed:()async{
//
//         },
//         label: const Text('To the lake!'),
//         icon: const Icon(Icons.directions_boat),
//       ),
//     );
//   }
//
// }
