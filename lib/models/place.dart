import 'dart:io';

import 'package:flutter/foundation.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  const PlaceLocation({
    @required this.latitude,
    @required this.longitude,
    this.address,
  });
}

class Place {
  final int id;
  final String title;
  final PlaceLocation location;
  final String country;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.country,
  });
}
