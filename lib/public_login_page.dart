import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kStylingText = TextStyle(
    fontSize: 15.0,
    fontFamily: 'Merriweather',
    fontWeight: FontWeight.bold,
    color: Color(0xFF01579B),
    letterSpacing: 1.0);

TextEditingController userId = TextEditingController();
TextEditingController password = TextEditingController();

String publicUserId;
String publicPassword;

class PublicLoginPage extends StatefulWidget {
  @override
  _PublicLoginPageState createState() => _PublicLoginPageState();
}

class _PublicLoginPageState extends State<PublicLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Center(
          child: Text('Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Merriweather',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0)),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'PUBLIC-USER',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'LakkiReddy',
                                color: Colors.lightBlue[900],
                                letterSpacing: 5.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FontAwesomeIcons.male,
                          size: 35.0,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.045,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.70,
                  width: double.maxFinite,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blue[200],
                      border: Border.all(
                          style: BorderStyle.solid,
                          width: 3.0,
                          color: Colors.lightBlue[900])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Merriweather',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF01579B),
                              letterSpacing: 1.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(12.0)),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: TextField(
                            controller: password,
                            decoration: InputDecoration(
                              fillColor: Colors.lightBlue[100],
                              border: InputBorder.none,
                              hintText: '      Enter your mobile number ',
                              hintStyle: kStylingText,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              onPressed: () {
                                publicUserId = userId.text;
                                publicPassword = password.text;
                                setState(() {});
                                //checkLoginCredentials(publicUserId,publicPassword);
                                Navigator.pushNamed(context, '4');
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.lightBlue[700],
                                    border: Border.all(
                                        color: Colors.lightBlue[900])),
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlue[100],
                                        letterSpacing: 3.0,
                                        fontFamily: 'Merriweather'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'OR',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Merriweather',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF01579B),
                              letterSpacing: 1.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025),
                      FlatButton(
                        onPressed: () {
                          setState(() {});
                          Navigator.pushNamed(context, '3');
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.lightBlue[700],
                              border: Border.all(color: Colors.lightBlue[900])),
                          child: Center(
                            child: Text(
                              'Sign-Up',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue[100],
                                  letterSpacing: 3.0,
                                  fontFamily: 'Merriweather'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
