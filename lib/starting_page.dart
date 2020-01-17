import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  void playSound(int soundNumber) {
    final gobble = AudioCache();
    gobble.play('sound$soundNumber.wav');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: new MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.lightBlue[900],
              title: Text(
                'Cyber Cop',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              centerTitle: true,
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Center(
                      child: Text(
                        'Cyber Cops',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.lightBlue[50],
                          border: Border.all(color: Colors.lightBlue[900])),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'option 1',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue[900],
                              letterSpacing: 3.0,
                              fontFamily: 'Merriweather'),
                        ),
                      ),
                      width: double.maxFinite,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        playSound(1);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.lightBlue[50],
                          border: Border.all(color: Colors.lightBlue[900])),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'option 2',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue[900],
                              letterSpacing: 3.0,
                              fontFamily: 'Merriweather'),
                        ),
                      ),
                      width: double.maxFinite,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        playSound(1);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.lightBlue[50],
                          border: Border.all(color: Colors.lightBlue[900])),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'option 3',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue[900],
                              letterSpacing: 3.0,
                              fontFamily: 'Merriweather'),
                        ),
                      ),
                      width: double.maxFinite,
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[],
            ),
          ),
        ),
        onWillPop: () {
          return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.lightBlue[100],
                title: Text(
                  "Confirm Exit",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black38),
                ),
                content: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
                  child: Text(
                    "Are you sure you want to exit?",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.lightBlue[900]),
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Card(
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "YES",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.lightBlue[900]),
                          ),
                        )),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                  FlatButton(
                    child: Card(
                      color: Colors.grey[100],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "NO",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.lightBlue[900]),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            },
          );
        });
  }
}
