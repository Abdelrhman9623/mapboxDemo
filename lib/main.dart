import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:map/screens/Home_screen.dart';
import 'package:map/screens/map_Screen.dart';
import 'package:map/services/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: LocationHandler(),
      child: MaterialApp(
        title: 'Map Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          MapScreen.routeName: (context) => MapScreen()
        },
      ),
    );
  }
}
