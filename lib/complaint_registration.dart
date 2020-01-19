import 'package:card_settings/card_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'globals.dart' as globals;

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
      home: CompRegister(),
      theme: ThemeData(primaryColor: Colors.lightBlue[900]),
    );
  }
}

class CompRegister extends StatefulWidget {
  @override
  _CompRegisterState createState() => _CompRegisterState();
}

class _CompRegisterState extends State<CompRegister> {
  String city;
  String subject;
  bool anonymous = false;
  String placeOfOccurrence;
  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
  );
  String description;
  bool _autoValidate = false;
  bool _showMaterialonIOS = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> placeKey = GlobalKey<FormState>();

  final GlobalKey<FormState> describeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> isAnonymous = GlobalKey<FormState>();

  final GlobalKey<FormState> occurrenceKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _subjectKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          title: Text('Complaint Form',
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
              label: 'FILL THE COMPLAINT SHEET',
              labelAlign: TextAlign.center,
              color: Colors.lightBlue[900],
              showMaterialonIOS: _showMaterialonIOS,
            ),
            children: <Widget>[
              occurrence(2),
              cityNameGetter(),
              describer(5),
              anonymousity(),
              subjectsPicker(),
            ],
          ),
          CardSettingsSection(
            showMaterialonIOS: _showMaterialonIOS,
            children: <Widget>[
              uploadEvidenceButton(),
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
      onPressed: () async {
        SharedPreferences getter = await SharedPreferences.getInstance();

        String mobileNo = getter.getString('mobileKey');
        String address = getter.getString('addressKey');
        String dob = getter.getString('dateKey');
        String nameOfUser = getter.getString('nameKey');
        String gender = getter.getString('sexKey');

        if (subject != null &&
            city != null &&
            description != null &&
            placeOfOccurrence != null) {
          if (globals.evidence != true) {
            _showSnackBar(Text('Upload the evidence.'));
          } else {
            print(mobileNo);
            print(address);
            print(dob);
            print(nameOfUser);
            print(gender);
            _showSnackBar(Text('Complaint registered successfully!'));
            Navigator.pushNamed(context, '3');
          }
        } else {
          _showSnackBar(Text('Please fill in all the details.'));
        }
      },
    );
  }

  CardSettingsButton uploadEvidenceButton() {
    return CardSettingsButton(
      showMaterialonIOS: _showMaterialonIOS,
      label: 'Upload Evidence',
      bottomSpacing: 5,
      onPressed: () {
        Navigator.pushNamed(context, '6');
      },
    );
  }

  CardSettingsListPicker subjectsPicker() {
    return CardSettingsListPicker(
      showMaterialonIOS: _showMaterialonIOS,
      key: _subjectKey,
      label: 'Subject',
      initialValue: subject,
      hintText: 'Select One',
      autovalidate: _autoValidate,
      options: <String>[
        'Assault',
        'Robbery',
        'Kidnapping',
        'Sexual abuse',
        'Drunk driving',
        'Bribery Corruption'
      ],
      values: <String>[
        'Assault',
        'Robbery',
        'Kidnapping',
        'Sexual',
        'Drunk',
        'Bribery'
      ],
      validator: (String value) {
        if (value == null || value.isEmpty) return 'Pick a subject.';
        return null;
      },
      onSaved: (value) => subject = value,
      onChanged: (value) {
        setState(() {
          subject = value;
        });
      },
    );
  }

  CardSettingsSwitch anonymousity() {
    return CardSettingsSwitch(
      showMaterialonIOS: _showMaterialonIOS,
      key: isAnonymous,
      label: 'Anonymous complaint?',
      labelWidth: 240.0,
      initialValue: false,
      onSaved: (value) => anonymous = value,
      onChanged: (value) {
        if (anonymous == true) {
          setState(() {
            anonymous = false;
          });
          _showSnackBar(Text('NON ANONYMOUS COMPLAINT'));
        } else if (anonymous == false) {
          setState(() {
            anonymous = true;
          });
          Alert(
            context: context,
            style: alertStyle,
            type: AlertType.warning,
            title: "Warning!",
            desc:
                "In anonymous complaint your details will be concealed .Any spams would be strictly punished.",
            buttons: [
              DialogButton(
                child: Text(
                  "CONTINUE",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
        }
      },
    );
  }

  CardSettingsParagraph occurrence(int lines) {
    return CardSettingsParagraph(
      showMaterialonIOS: _showMaterialonIOS,
      key: occurrenceKey,
      label: 'Place of Occurrence',
      requiredIndicator: Text('*', style: TextStyle(color: Colors.red)),
      initialValue: placeOfOccurrence,
      numberOfLines: lines,
      onSaved: (value) => placeOfOccurrence = value,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Place is required.';
        return null;
      },
      onChanged: (value) {
        setState(() {
          placeOfOccurrence = value;
        });
      },
    );
  }

  CardSettingsParagraph describer(int lines) {
    return CardSettingsParagraph(
      showMaterialonIOS: _showMaterialonIOS,
      key: describeKey,
      label: 'Description',
      requiredIndicator: Text('*', style: TextStyle(color: Colors.red)),
      initialValue: description,
      numberOfLines: lines,
      onSaved: (value) => description = value,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Description is required.';
        return null;
      },
      onChanged: (value) {
        setState(() {
          description = value;
        });
      },
    );
  }

  CardSettingsText cityNameGetter() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: placeKey,
      label: 'City Name',
      initialValue: city,
      requiredIndicator: Text('*', style: TextStyle(color: Colors.red)),
      autovalidate: _autoValidate,
      validator: (value) {
        if (value == null || value.isEmpty) return 'City Name is required.';
        return null;
      },
      showErrorIOS: city == null || city.isEmpty,
      onSaved: (value) => city = value,
      onChanged: (value) {
        setState(() {
          city = value;
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
