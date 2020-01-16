import 'package:card_settings/card_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  DateTime showDateTime = DateTime(2000, 1, 1);

  bool _autoValidate = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _typeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addressKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _dateKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _phoneKey = GlobalKey<FormState>();

  bool _showMaterialonIOS = true;

  @override
  Widget build(BuildContext context) {
//    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
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
              showMaterialonIOS: _showMaterialonIOS,
            ),
            children: <Widget>[
              nameGetter(),
              genderPicker(),
              datePicker(),
              addressGetter(5),
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
            Navigator.pushNamed(context, '3');
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
