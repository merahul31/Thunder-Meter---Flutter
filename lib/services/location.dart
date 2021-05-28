import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('serviceEnable');
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Fluttertoast.showToast(
              msg: 'Permission Denied',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
      if (permission == LocationPermission.deniedForever) {
        Fluttertoast.showToast(
            msg: 'Location Permission Denied',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black26,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      bool isLocationService = await Geolocator.isLocationServiceEnabled();
      if (isLocationService) {
        print('true');
      } else {
        print('false');
      }
      Position position = await Geolocator.getLastKnownPosition(
          forceAndroidLocationManager: true);
      latitude = position.latitude;
      longitude = position.longitude;
      print('$latitude $longitude');
    } catch (e) {
      print(e);
    }
  }
}
