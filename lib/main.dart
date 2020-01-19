import 'package:flutter/material.dart';

import 'complaint_registration.dart';
import 'home_page.dart';
import 'login_page_decider.dart';
import 'map_tracking.dart';
import 'media_evidence.dart';
import 'police_login.dart';
import 'sign_up_page.dart';
import 'starting_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '0',
        routes: {
          '0': (context) => HomePage(),
          '1': (context) => LoginPageDecider(),
          '2': (context) => SignUpPage(),
          '3': (context) => Start(),
          '4': (context) => PoliceLogin(),
          '5': (context) => CompRegister(),
          '6': (context) => EvidenceUploader(),
          '7': (context) => FireMap(),
        });
  }
}
