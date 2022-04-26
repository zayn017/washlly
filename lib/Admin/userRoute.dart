import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wishy/DialogBox/errorDialog.dart';
import '../global/global.dart';
import '../widgets/loadingWidget.dart';

class MapSampleAdminUserRoute extends StatefulWidget {
  var AddressFromBooking;
  @override
  MapSampleAdminUserRoute({required this.AddressFromBooking});
  State<MapSampleAdminUserRoute> createState() => MapSampleStatea();
}

String? locationAssigned;

class MapSampleStatea extends State<MapSampleAdminUserRoute> {
  Position? position;
  List<Placemark>? placemarks;
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
  late LatLng latLatPostion;
  var user = sharedPreferences?.getString("uid");

  void locatePostion() async {
    // Position positionNew = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    // CurrentPosition = positionNew;

    Stream<Position> positionNew = await Geolocator.getPositionStream();

    placemarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);

    Placemark Pmark = placemarks![0];
    String newCUrrentAddress =
        '${Pmark.subThoroughfare} ${Pmark.thoroughfare}, ${Pmark.subLocality} ${Pmark.locality}, ${Pmark.subAdministrativeArea}, ${Pmark.administrativeArea} ${Pmark.postalCode}, ${Pmark.country}';

    locationAssigned = newCUrrentAddress.toString();
    setState(() {
      locationAssigned = newCUrrentAddress.toString();
    });

    CameraPosition cameraPosition =
        CameraPosition(target: latLatPostion, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.427934534, -122.085),
    zoom: 14.4744,
  );

  late Position CurrentPosition;
  late var geoLocator = Geolocator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Washly"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: _kGooglePlex,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              trafficEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;

                locatePostion();
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter your Location",
                suffixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.all(5),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
