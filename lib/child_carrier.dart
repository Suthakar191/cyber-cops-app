import 'package:flutter/material.dart';

const kSizeBoxHeight = 20.0;
const kIconHeight = 80.0;

class ChildCarrier extends StatelessWidget {
  final IconData iconCreator;
  final String profileIdentifier;

  ChildCarrier({@required this.iconCreator, @required this.profileIdentifier});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconCreator,
          size: kIconHeight,
        ),
        SizedBox(
          height: kSizeBoxHeight,
        ),
        Text(
          profileIdentifier,
          style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w900,
              fontFamily: 'LakkiReddy',
              color: Colors.black,
              letterSpacing: 5.0),
        )
      ],
    );
  }
}
