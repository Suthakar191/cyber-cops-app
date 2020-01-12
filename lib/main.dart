import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page_decider.dart';
import 'otp_verification.dart';
import 'police_login.dart';
import 'public_login_page.dart';
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
        home: HomePage(),
        initialRoute: '0',
        routes: {
          '0': (context) => HomePage(),
          '1': (context) => LoginPageDecider(),
          '2': (context) => PublicLoginPage(),
          '3': (context) => UserSignUp(),
          '4': (context) => OtpVerification(),
          '5': (context) => Start(),
          '6': (context) => PoliceLogin(),
        });
  }
}
