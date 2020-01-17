import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_maker.dart';
import 'child_carrier.dart';

const kActiveColour = Color(0xFF01579B);
const kInactiveColour = Color(0xFF90CAF9);
enum ProfileType { public, police, guest }
ProfileType profileSelector = ProfileType.public;

Color normalCardColor = kInactiveColour;
Color policeCardColor = kInactiveColour;
Color guestCardColor = kInactiveColour;

class LoginPageDecider extends StatefulWidget {
  @override
  _LoginPageDeciderState createState() => _LoginPageDeciderState();
}

class _LoginPageDeciderState extends State<LoginPageDecider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue[900],
        title: Text(
          'LOGIN',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: DoubleBackToCloseApp(
          child: Container(
            color: Colors.blue[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: 'cop',
                  child: Container(
                    child: Image(
                      image: AssetImage('images/cop1.png'),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.maxFinite,
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: CardMaker(
                          onPressed: () {
                            setState(() {
                              profileSelector = ProfileType.public;
                            });
                          },
                          colour: profileSelector == ProfileType.public
                              ? normalCardColor = kActiveColour
                              : normalCardColor = kInactiveColour,
                          childCreator: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ChildCarrier(
                              iconCreator: FontAwesomeIcons.male,
                              profileIdentifier: 'PUBLIC',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: CardMaker(
                          onPressed: () {
                            setState(() {
                              profileSelector = ProfileType.police;
                            });
                          },
                          colour: profileSelector == ProfileType.police
                              ? normalCardColor = kActiveColour
                              : normalCardColor = kInactiveColour,
                          childCreator: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ChildCarrier(
                              iconCreator: FontAwesomeIcons.idCard,
                              profileIdentifier: 'POLICE',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                FlatButton(
                  onPressed: () {
                    if (profileSelector == ProfileType.public) {
                      Navigator.pushNamed(context, '2');
                    } else {
                      Navigator.pushNamed(context, '4');
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.065,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.lightBlue[700],
                        border: Border.all(color: Colors.lightBlue[900])),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'continue',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue[100],
                              letterSpacing: 3.0,
                              fontFamily: 'Merriweather'),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          snackBar: SnackBar(
            content: Text('Tap again to exit.'),
          ),
        ),
      ),
    );
  }
}
