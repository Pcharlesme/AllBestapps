import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationDisplay extends StatefulWidget {
  @override
  _LocationDisplayState createState() => _LocationDisplayState();
}

class _LocationDisplayState extends State<LocationDisplay> {
  Position? _currentPosition;
  String? _currentAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var placemarks = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    var placemark = placemarks.first;
    setState(() {
      _currentPosition = position;
      _currentAddress =
          "${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _currentAddress != null
            ? Text("Address: $_currentAddress")
            : const CircularProgressIndicator(),
      ),
    );
  }
}
