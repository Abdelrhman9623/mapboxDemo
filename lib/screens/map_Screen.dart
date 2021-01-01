import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapScreen extends StatefulWidget {
  static const routeName = '/mapScreen';
  final double lat;
  final double lang;
  MapScreen({this.lat, this.lang});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Location _location = new Location();
  MapboxMapController _controller;

  void _onMapCreate(MapboxMapController ctr) {
    _controller = ctr;
  }

  Future<void> _createIcon() async {
    _controller.animateCamera(CameraUpdate.newLatLngZoom(
      LatLng(30.042997, 30.976759),
      14.0,
    ));
    _controller.addSymbol(SymbolOptions(
        geometry: LatLng(30.042997, 30.976759),
        iconSize: 3,
        iconImage: 'bank-11',
        textField: 'متجر المنى',
        textOffset: Offset(0, 2)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map App Demo'),
      ),
      body: MapboxMap(
        styleString: 'mapbox://styles/abdelrhman-96/ckjd07tg31y2r19ph39gapkzg',
        onMapCreated: _onMapCreate,
        myLocationEnabled: true,
        onStyleLoadedCallback: () {},
        initialCameraPosition: CameraPosition(
          zoom: 7.0,
          target: LatLng(widget.lat, widget.lang),
        ),
        zoomGesturesEnabled: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.zoom_in),
        onPressed: _createIcon,
      ),
    );
  }
}
