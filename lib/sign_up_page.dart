import 'package:card_settings/card_settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

const kStylingText = TextStyle(
    fontSize: 23.0,
    fontFamily: 'Merriweather',
    fontWeight: FontWeight.bold,
    color: Color(0xFF01579B),
    letterSpacing: 1.0);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Card Settings Example',
      home: SignUpPage(),
      theme: ThemeData(primaryColor: Colors.lightBlue[900]),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String name = '';
  String mobInput;
  int mobile;
  String sex;
  String address;
  DateTime showDateTime = DateTime(2000, 01, 01);
  String formattedDate;
  String smsOTP;
  String verificationId;
  String errorMessage = '';
  bool _autoValidate = false;
  bool _showMaterialonIOS = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _typeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addressKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _dateKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _phoneKey = GlobalKey<FormState>();
  final DbRef = FirebaseDatabase.instance.reference();

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhone() async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsOTPDialog(context).then((value) {
        print('sign in');
      });
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: this.mobInput, // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;
          },
          codeSent:
              smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 20),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
          },
          verificationFailed: (AuthException exceptio) {
            print('${exceptio.message}');
          });
    } catch (e) {
      handleError(e);
    }
  }

  Future<bool> smsOTPDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            backgroundColor: Colors.lightBlue[50],
            title: Text(
              'Enter OTP Code',
              style: kStylingText,
            ),
            content: Container(
              color: Colors.lightBlue[100],
              height: 100,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 6.0),
                  child: PinEntryTextField(
                    onSubmit: (value) {
                      this.smsOTP = value;
                    },
                    showFieldAsBox: true,
                    fields: 6,
                    fontSize: 10.0,
                    fieldWidth: 30.0,
                  ),
                ),
                (errorMessage != ''
                    ? Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red),
                      )
                    : Container())
              ]),
            ),
            contentPadding: EdgeInsets.all(10),
            actions: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.lightBlue[100],
                      border: Border.all(color: Colors.lightBlue[900])),
                  child: FlatButton(
                    child: Text('DONE',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Merriweather',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF01579B),
                            letterSpacing: 1.0)),
                    onPressed: () {
                      _auth.currentUser().then((user) {
                        if (user != null) {
                          Navigator.of(context).pop();
                          writedata();
                          Navigator.pushNamed(context, "3");
                        } else {
                          signIn();
                        }
                      });
                    },
                  ),
                ),
              )
            ],
          );
        });
  }

  signIn() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      AuthResult result = await _auth.signInWithCredential(credential);
      final FirebaseUser user = result.user;
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      Navigator.of(context).pop();
      writedata();
      Navigator.pushNamed(context, '3');
    } catch (e) {
      handleError(e);
    }
  }

  handleError(PlatformException error) {
    print(error);
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() {
          errorMessage = 'Invalid Code';
        });
        Navigator.of(context).pop();
        smsOTPDialog(context).then((value) {
          print('sign in');
        });
        break;
      default:
        setState(() {
          errorMessage = error.message;
        });

        break;
    }
  }

  void writedata() {
    print("Inside writedata");
    print("$name , $address, $sex , $formattedDate");
    DbRef.child("User").child("$mobile").set({
      "Address": "$address",
      "Sex": "$sex",
      "Dob": "$formattedDate",
      "Name": "$name"
    });
  }

  @override
  Widget build(BuildContext context) {
//    var orientation = MediaQuery.of(context).orientation;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardColor: Colors.lightBlue[100], // used for field backgrounds
        buttonColor: Colors.lightBlue[900], // background color of buttons
        textTheme: TextTheme(
          button: TextStyle(
              color: Colors.lightBlue[100],
              fontSize: 20.0,
              fontFamily: 'Merriweather',
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0), // style of button text
          subhead:
              TextStyle(color: Colors.lightBlue[900]), // style of input text
        ),
      ),
      home: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          title: Text('SIGN-UP',
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Merriweather',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0)),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: _buildPortraitLayout(),
        ),
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return CardSettings.sectioned(
        showMaterialonIOS: _showMaterialonIOS,
        labelWidth: 100,
        children: <CardSettingsSection>[
          CardSettingsSection(
            showMaterialonIOS: _showMaterialonIOS,
            header: CardSettingsHeader(
              label: 'DETAILS',
              labelAlign: TextAlign.center,
              color: Colors.lightBlue[900],
              showMaterialonIOS: _showMaterialonIOS,
            ),
            children: <Widget>[
              nameGetter(),
              genderPicker(),
              datePicker(),
              addressGetter(3),
              phonrNoGetter(),
            ],
          ),
          CardSettingsSection(
            showMaterialonIOS: _showMaterialonIOS,
            children: <Widget>[
              registerButton(),
            ],
          ),
        ]);
  }

  CardSettingsButton registerButton() {
    return CardSettingsButton(
      showMaterialonIOS: _showMaterialonIOS,
      label: 'Register',
      bottomSpacing: 5,
      onPressed: () {
        print(mobInput);
        print(name);
        print(sex);
        print(address);
        if (mobInput != null &&
            name != null &&
            sex != null &&
            address != null) {
          if (mobile.toString().length != 10) {
            _showSnackBar(Text('Please enter a valid mobile number.'));
          } else
            verifyPhone();
        } else {
          _showSnackBar(Text('Please fill in all the details.'));
        }
      },
    );
  }

  CardSettingsPhone phonrNoGetter() {
    return CardSettingsPhone(
      showMaterialonIOS: _showMaterialonIOS,
      key: _phoneKey,
      requiredIndicator: Text('*', style: TextStyle(color: Colors.red)),
      label: 'Mobile-No',
      inputMask: '0000000000',
      initialValue: mobile,
      autovalidate: _autoValidate,
      validator: (value) {
        if (value != null && value.toString().length != 10)
          return 'Incomplete number';
        return null;
      },
      onSaved: (value) => mobile = value,
      onChanged: (value) {
        setState(() {
          mobile = value;
          mobInput = '+91${mobile.toString()}';
        });
      },
    );
  }

  CardSettingsDatePicker datePicker() {
    return CardSettingsDatePicker(
      showMaterialonIOS: _showMaterialonIOS,
      key: _dateKey,
      firstDate: DateTime(1960),
      lastDate: DateTime(2100),
      justDate: true,
      icon: Icon(Icons.calendar_today),
      requiredIndicator: Text('*', style: TextStyle(color: Colors.red)),
      label: 'DOB',
      initialValue: showDateTime,
      onSaved: (value) => showDateTime = updateJustDate(value, showDateTime),
      onChanged: (value) {
        setState(() {
          showDateTime = value;
          var dateRecorder = showDateTime.toString();
          var date = DateTime.parse(dateRecorder);
          formattedDate = "${date.day}-${date.month}-${date.year}";
        });
//            'Show Date', updateJustDate(value, _ponyModel.showDateTime));
      },
    );
  }

  CardSettingsParagraph addressGetter(int lines) {
    return CardSettingsParagraph(
      showMaterialonIOS: _showMaterialonIOS,
      key: addressKey,
      label: 'Address',
      requiredIndicator: Text('*', style: TextStyle(color: Colors.red)),
      initialValue: address,
      numberOfLines: lines,
      onSaved: (value) => address = value,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Address is required.';
        return null;
      },
      onChanged: (value) {
        setState(() {
          address = value;
        });
      },
    );
  }

  CardSettingsListPicker genderPicker() {
    return CardSettingsListPicker(
      showMaterialonIOS: _showMaterialonIOS,
      key: _typeKey,
      label: 'sex',
      requiredIndicator: Text('*', style: TextStyle(color: Colors.red)),
      initialValue: sex,
      hintText: 'Select gender',
      autovalidate: _autoValidate,
      options: <String>['Male', 'Female', 'other'],
      values: <String>['M', 'F', 'TG'],
      validator: (String value) {
        if (value == null || value.isEmpty) return 'You must pick a type.';
        return null;
      },
      onSaved: (value) => sex = value,
      onChanged: (value) {
        setState(() {
          sex = value;
        });
      },
    );
  }

  CardSettingsText nameGetter() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: nameKey,
      label: 'Name',
      initialValue: name,
      requiredIndicator: Text('*', style: TextStyle(color: Colors.red)),
      autovalidate: _autoValidate,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Name is required.';
        return null;
      },
      showErrorIOS: name == null || name.isEmpty,
      onSaved: (value) => name = value,
      onChanged: (value) {
        setState(() {
          name = value;
        });
      },
    );
  }

  void _showSnackBar(Widget text) {
    _scaffoldKey.currentState.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: text,
      ),
    );
  }
}
