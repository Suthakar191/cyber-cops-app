import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'login_page_decider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _visible = false;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = new Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _visible = !_visible;
      });
    });
    new Future.delayed(
        const Duration(seconds: 5),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPageDecider()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                0.2,
                0.4,
                0.6,
                0.9
              ],
                  colors: [
                Colors.lightBlue[900],
                Colors.lightBlue[300],
                Colors.lightBlue[100],
                Colors.lightBlue[900],
              ])),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Hero(
                    tag: 'cop',
                    child: Container(
                      child: Image(
                        image: AssetImage('images/cop1.png'),
                        height: 400,
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: Duration(seconds: 4),
                    child: Text(
                      "Cyber Cops",
                      style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue[900],
                          letterSpacing: 3.0,
                          fontFamily: 'LakkiReddy'),
                    ),
                  ),
                ),
//                Container(
//                  width: double.maxFinite,
//                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(20),
//                      gradient: LinearGradient(
//                          begin: Alignment.topLeft,
//                          end: Alignment.bottomRight,
//                          stops: [
//                            0.2,
//                            0.4,
//                            0.6,
//                            0.9
//                          ],
//                          colors: [
//                            Colors.lightBlue[900],
//                            Colors.lightBlue[100],
//                            Colors.lightBlue[300],
//                            Colors.lightBlue[900],
//                          ])),
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Center(
//                      child: Text(
//                        "Loading...",
//                        style: TextStyle(
//                            fontSize: 20.0,
//                            fontWeight: FontWeight.bold,
//                            color: Colors.lightBlue[900],
//                            letterSpacing: 8.0,
//                            fontFamily: 'LakkiReddy'),
//                      ),
//                    ),
//                  ),
//                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
