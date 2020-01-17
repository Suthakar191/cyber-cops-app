import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'login_page_decider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(seconds: 2),
        vsync: this,
        lowerBound: 0,
        upperBound: 100);
    animation =
        ColorTween(begin: Colors.lightBlue[600], end: Colors.lightBlue[50])
            .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });

    new Future.delayed(const Duration(seconds: 5), () {
      FirebaseAuth.instance.currentUser().then((user) {
        if (user != null) {
          Navigator.of(context).pop();
          Navigator.pushNamed(context, "3");
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPageDecider()),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
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
                Colors.lightBlue[100],
                Colors.lightBlue[200],
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: animation.value),
                      child: Image(
                        image: AssetImage('images/cop1.png'),
                        height: controller.value,
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ColorizeAnimatedTextKit(
                      text: ['Cyber Cops'],
                      speed: Duration(milliseconds: 600),
                      textStyle: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue[900],
                          letterSpacing: 3.0,
                          fontFamily: 'LakkiReddy'),
                      colors: [
                        Colors.lightBlue[900],
                        Colors.lightBlue[100],
                        Colors.black12,
                        Colors.lightBlue[900],
                      ],
                      textAlign: TextAlign.start,
                      alignment: AlignmentDirectional.topStart // o

                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
