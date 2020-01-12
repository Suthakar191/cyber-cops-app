import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

const kStylingText = TextStyle(
    fontSize: 15.0,
    fontFamily: 'Merriweather',
    fontWeight: FontWeight.bold,
    color: Color(0xFF01579B),
    letterSpacing: 1.0);

TextEditingController otp = TextEditingController();
TextEditingController mobileNo = TextEditingController();

String mob;
int otpNo;

class OtpVerification extends StatefulWidget {
  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          title: Center(
            child: Text('OTP-Verification',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0)),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 100.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blue[200],
                      border: Border.all(
                          style: BorderStyle.solid,
                          width: 3.0,
                          color: Colors.lightBlue[900])),
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(12.0)),
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: TextField(
                            controller: mobileNo,
                            decoration: InputDecoration(
                              fillColor: Colors.lightBlue[100],
                              border: InputBorder.none,
                              hintText: '      Enter your mobile-no ',
                              hintStyle: kStylingText,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045,
                      ),
                      FlatButton(
                        onPressed: () {
                          mob = mobileNo.text;
                          setState(() {});
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.lightBlue[700],
                              border: Border.all(color: Colors.lightBlue[900])),
                          child: Center(
                            child: Text(
                              'Get OTP',
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Enter - OTP',
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
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PinEntryTextField(
                            fields: 6,
                            showFieldAsBox: true,
                            onSubmit: (String pin) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Pin"),
                                      content: Text('Pin entered is $pin'),
                                    );
                                  }); //end showDialog()
                            }, // end onSubmit
                          ), // end PinEntryTextField()
                        ), // end Padding()
                      ), //
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045,
                      ),
                      FlatButton(
                        onPressed: () {
                          otpNo = int.parse(otp.text);

                          setState(() {});
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
                              'Verify OTP',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue[100],
                                  letterSpacing: 3.0,
                                  fontFamily: 'Merriweather'),
                            ),
                          ),
                        ),
                      ), // end Container()
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
