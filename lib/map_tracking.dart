import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: Scaffold(body: FireMap()));
  }
}

class FireMap extends StatefulWidget {
  @override
  State createState() => FireMapState();
}

class FireMapState extends State<FireMap> {
  final db = FirebaseDatabase.instance
      .reference()
      .child("Tracking")
      .child("1579095041927");
  String lat = '12.9716';
  String long = '77.5946';

  @override
  Widget build(BuildContext context) {
    db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      lat = values["Lat"].toString();
      long = values["Long"].toString();
    });

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Maps With Marker'),
              backgroundColor: Colors.lightBlue[900],
              centerTitle: true,
            ),
            body: new FlutterMap(
                options: new MapOptions(
                  center: new LatLng(double.parse(lat), double.parse(long)),
                  zoom: 17.0,
                ),
                layers: [
                  new TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c']),
                  new MarkerLayerOptions(
                    markers: [
                      new Marker(
                        width: 80.0,
                        height: 80.0,
                        point:
                            new LatLng(double.parse(lat), double.parse(long)),
                        builder: (ctx) => new Container(
                          child: new FlutterLogo(),
                        ),
                      ),
                    ],
                  )
                ])));
  }
}
