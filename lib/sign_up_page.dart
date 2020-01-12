import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kStylingText = TextStyle(
    fontSize: 15.0,
    fontFamily: 'Merriweather',
    fontWeight: FontWeight.bold,
    color: Color(0xFF01579B),
    letterSpacing: 1.0);
String aadharNo;
String mobile;
String gmail;
String nameOfPerson;
String password;

TextEditingController name = TextEditingController();
TextEditingController age = TextEditingController();
TextEditingController aadhar = TextEditingController();
TextEditingController mobNo = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController passcode = TextEditingController();

class UserSignUp extends StatefulWidget {
  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  DateTime selectedDate = DateTime.now();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1940, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.lightBlue[900],
          title: Center(
            child: Text(
              "Let's Start",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.lightBlue[200],
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
              ),
              child: ListView(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
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
                              width: 15,
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
                      SizedBox(height: 10.0),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: double.maxFinite,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blue[200],
                            border: Border.all(
                                style: BorderStyle.solid,
                                width: 3.0,
                                color: Colors.lightBlue[900])),
                        child: ListView(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'NAME : ',
                                        style: kStylingText,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue[300],
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 25),
                                        child: TextField(
                                          controller: name,
                                          decoration: InputDecoration(
                                            fillColor: Colors.lightBlue[100],
                                            border: InputBorder.none,
                                            hintText: '      Enter your name ',
                                            hintStyle: kStylingText,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'DOB : ',
                                        style: kStylingText,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue[300],
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: FlatButton(
                                          onPressed: () {
                                            selectDate(context);
                                            print(selectedDate);
                                          },
                                          child: Text(
                                            "${selectedDate.toLocal()}"
                                                .split(' ')[0],
                                            style: kStylingText,
                                          )),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'AADHAAR NO : ',
                                        style: kStylingText,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue[300],
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: TextField(
                                        controller: aadhar,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          fillColor: Colors.lightBlue[100],
                                          border: InputBorder.none,
                                          hintText: '        Aadhar-no ',
                                          hintStyle: kStylingText,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'ADDRESS : ',
                                        style: kStylingText,
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      decoration: BoxDecoration(
                                          color: Colors.blue[300],
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: TextField(
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        controller: address,
                                        decoration: InputDecoration(
                                          fillColor: Colors.lightBlue[100],
                                          border: InputBorder.none,
                                          hintText: '    Enter your address ',
                                          hintStyle: kStylingText,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'MOBILE NO : ',
                                        style: kStylingText,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue[300],
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: TextField(
                                        controller: mobNo,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          fillColor: Colors.lightBlue[100],
                                          border: InputBorder.none,
                                          hintText: '        Mobile-no ',
                                          hintStyle: kStylingText,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'EMAIL-ID : ',
                                        style: kStylingText,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue[300],
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 25),
                                        child: TextField(
                                          controller: email,
                                          decoration: InputDecoration(
                                            fillColor: Colors.lightBlue[100],
                                            border: InputBorder.none,
                                            hintText: '   Enter your gmail-id ',
                                            hintStyle: kStylingText,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'PASSWORD : ',
                                        style: kStylingText,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue[300],
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 25),
                                        child: TextField(
                                          controller: passcode,
                                          decoration: InputDecoration(
                                            fillColor: Colors.lightBlue[100],
                                            border: InputBorder.none,
                                            hintText: '   Create password ',
                                            hintStyle: kStylingText,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.042,
                                ),
                                FlatButton(
                                  onPressed: () {
                                    nameOfPerson = name.text;
                                    aadharNo = aadhar.text;
                                    mobile = mobNo.text;
                                    gmail = email.text;
                                    password = passcode.text;

                                    Navigator.pushNamed(context, '2');
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.lightBlue[700],
                                        border: Border.all(
                                            color: Colors.lightBlue[900])),
                                    child: Center(
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.lightBlue[100],
                                            letterSpacing: 3.0,
                                            fontFamily: 'Merriweather'),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
