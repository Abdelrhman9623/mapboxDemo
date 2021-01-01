import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:map/models/place.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:http/http.dart' as http;

class LocationHandler with ChangeNotifier {
  List<Place> _items = [
    Place(
      id: 1,
      title: 'Soudia Arabia',
      country: 'Soudia Arabia',
      location: PlaceLocation(
        latitude: 23.8859,
        longitude: 45.0792,
      ),
    ),
    Place(
      id: 2,
      title: 'Egypt',
      country: 'Egypt',
      location: PlaceLocation(
        latitude: 26.8206,
        longitude: 30.8025,
      ),
    ),
    Place(
      id: 3,
      title: 'Sudan',
      country: 'Sudan',
      location: PlaceLocation(
        latitude: 12.8628,
        longitude: 30.2176,
      ),
    ),
  ];
  Location _location = Location();
  MapboxMapController _controller;

  List<Place> get countries {
    return [..._items];
  }

  Place findByid(int id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> getCounteries(double lat, double lan) async {}
  // TO GET CURRENT USER LOCATION
  Future<void> getCurrentLocation() async {}
  Future<void> _getMyLocation() async {
    _location.hasPermission();
    var newlocal = await _location.getLocation();
    // _controller.onCameraTrackingChanged(());
    _controller.animateCamera(CameraUpdate.newLatLngZoom(
      LatLng(newlocal.latitude, newlocal.longitude),
      9.0,
    ));
  }

  // TO ZOOM IN MAP
  Future<void> zoomInMap() async {}
  // TO ZOOM OUT MAP
  Future<void> zoomOutMap() async {}
}
