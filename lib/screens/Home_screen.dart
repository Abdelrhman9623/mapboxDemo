import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:map/screens/map_Screen.dart';
import 'package:map/services/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectCountry = 1;
  double lat;
  double long;

  Location _location = new Location();
  MapboxMapController _controller;
  @override
  void initState() {
    super.initState();
    _location.hasPermission();
    _location.requestPermission();
  }

  Future<void> _getMyLocation() async {
    _location.hasPermission();
    _location.requestPermission();
    var newlocal = await _location.getLocation();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MapScreen(
                  lat: newlocal.latitude,
                  lang: newlocal.longitude,
                )));
  }

  @override
  Widget build(BuildContext context) {
    final locatios = Provider.of<LocationHandler>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: DropdownButtonFormField<dynamic>(
                  onChanged: (newVal) {
                    newVal = selectCountry;
                  },
                  isDense: true,
                  validator: (val) {},
                  value: selectCountry,
                  onSaved: (val) {},
                  items: locatios.countries
                      .map((item) => DropdownMenuItem(
                            child: Text(item.country),
                            value: item.id,
                            onTap: () {
                              setState(() {
                                selectCountry = item.id;
                              });
                            },
                          ))
                      .toList(),
                ),
              ),
              FlatButton(
                child: Text('SHOW MAP'),
                onPressed: () {
                  var item = locatios.findByid(selectCountry);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MapScreen(
                                lat: item.location.latitude,
                                lang: item.location.longitude,
                              )));
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.location_on),
                label: Text('city'),
                onPressed: _getMyLocation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
