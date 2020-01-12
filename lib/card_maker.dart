import 'package:flutter/material.dart';

class CardMaker extends StatelessWidget {
  final Color colour;
  final Widget childCreator;
  final Function onPressed;
  CardMaker({@required this.colour, this.childCreator, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: childCreator,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
