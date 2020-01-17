import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page_decider.dart';
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
        initialRoute: '2',
        routes: {
          '0': (context) => HomePage(),
          '1': (context) => LoginPageDecider(),
          '2': (context) => SignUpPage(),
          '3': (context) => Start(),
          '4': (context) => PoliceLogin(),
        });
  }
}
