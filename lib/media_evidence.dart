import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'complaint_registration.dart';
import 'globals.dart' as globals;

class EvidenceUploader extends StatefulWidget {
  @override
  _EvidenceUploaderState createState() => _EvidenceUploaderState();
}

class _EvidenceUploaderState extends State<EvidenceUploader> {
  File _image;
  bool evidence;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Text('Upload Image'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Center(
              child: _image == null
                  ? Text('No image selected.')
                  : Image.file(_image),
            ),
          ),
          FlatButton(
            onPressed: () {
              if (_image != null) {
                globals.evidence = true;
              } else {
                globals.evidence = false;
              }
              Navigator.pop(context, MaterialPageRoute(builder: (context) {
                return CompRegister();
              }));
//              WRITE CODE HERE TO UPLOAD THE IMAGE TO FIREBASE
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.lightBlue[700],
                  border: Border.all(color: Colors.lightBlue[900])),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'UPLOAD',
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue[900],
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(
          Icons.add_a_photo,
        ),
      ),
    );
  }
}
