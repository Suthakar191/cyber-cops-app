import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'news_feed.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: new MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.lightBlue[50],
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
                      Navigator.pushNamed(context, '3');
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.lightBlue[50],
                          border: Border.all(color: Colors.lightBlue[900])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Icon(
                            FontAwesomeIcons.home,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                            child: Text(
                              'HOME',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue[900],
                                  letterSpacing: 1.0,
                                  fontFamily: 'Merriweather'),
                            ),
                          ),
                        ],
                      ),
                      width: double.maxFinite,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '5');
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.lightBlue[50],
                          border: Border.all(color: Colors.lightBlue[900])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Icon(
                              FontAwesomeIcons.newspaper,
                              size: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                            child: Text(
                              'REGISTER COMPLAINT',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue[900],
                                  letterSpacing: 1.0,
                                  fontFamily: 'Merriweather'),
                            ),
                          ),
                        ],
                      ),
                      width: double.maxFinite,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '3');
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.lightBlue[50],
                          border: Border.all(color: Colors.lightBlue[900])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Icon(
                            FontAwesomeIcons.inbox,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                            child: Text(
                              'STATUS',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue[900],
                                  letterSpacing: 1.0,
                                  fontFamily: 'Merriweather'),
                            ),
                          ),
                        ],
                      ),
                      width: double.maxFinite,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '7');

//                      WRITE CODE HERE TO INTEGRATE MAP
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.lightBlue[50],
                          border: Border.all(color: Colors.lightBlue[900])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Icon(
                              FontAwesomeIcons.map,
                              size: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                            child: Text(
                              'TRACKING ',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue[900],
                                  letterSpacing: 1.0,
                                  fontFamily: 'Merriweather'),
                            ),
                          ),
                        ],
                      ),
                      width: double.maxFinite,
                    ),
                  ),
                ],
              ),
            ),
            body: ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        NewsFeed(
                          image: Image(
                            image: AssetImage('images/ev.jpg'),
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: double.maxFinite,
                          ),
                          describe:
                              'Evidence plays a key role in cyper cops as spams could be controlled and make sure innocents are not punished',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        NewsFeed(
                          image: Image(
                            image: AssetImage('images/thief.jpg'),
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: double.maxFinite,
                          ),
                          describe:
                              'Guard your assets from thieves .Keep your doors locked when you are leaving out.Have good relation with your neighbours so that they would take care of your house when you are leaving somewhere.',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        NewsFeed(
                          image: Image(
                            image: AssetImage('images/arrest.png'),
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: double.maxFinite,
                          ),
                          describe:
                              'Cyber Cops app would be really helpful to police in catching thieves and burglars.It is providing additional security to the public.',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        NewsFeed(
                            image: Image(
                              image: AssetImage('images/woman.jpg'),
                              height: MediaQuery.of(context).size.height * 0.35,
                              width: double.maxFinite,
                            ),
                            describe:
                                'Women could wander with freedom in our society with the help of CyberCop app.'),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
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
