import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationDisplay extends StatefulWidget {
  @override
  _LocationDisplayState createState() => _LocationDisplayState();
}

class _LocationDisplayState extends State<LocationDisplay> {
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           final coordinates = new Coordinates(position.latitude, position.longitude);
          var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
        var first = addresses.first;
        print("${first.featureName} : ${first.addressLine}");
          Center(
            child: _currentPosition != null
                ? Text(
                    "Latitude: ${_currentPosition?.latitude}\nLongitude: ${_currentPosition?.longitude}")
                : const CircularProgressIndicator(),
          ),
          Center(
            child: _currentPosition != null
                ? Text(
                    "Latitude: ${_currentPosition?.accuracy}\nLongitude: ${_currentPosition?.timestamp}")
                : const CircularProgressIndicator(),
          ),
          
        ],
      ),
    );
  }
}
