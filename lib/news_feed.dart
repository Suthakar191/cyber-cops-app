import 'package:cyber_cop_app/globals.dart';
import 'package:flutter/material.dart';

const kSizeBoxHeight = 20.0;
const kIconHeight = 10.0;

class NewsFeed extends StatefulWidget {
  final String describe;
  final Image image;
  NewsFeed({@required this.describe, @required this.image});

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: kSizeBoxHeight,
          ),
          widget.image,
          SizedBox(
            height: kSizeBoxHeight,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (seeMore == false) {
                      seeMore = true;
                    } else {
                      seeMore = false;
                    }
                  });
                },
                child: Text(
                  widget.describe,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: seeMore == true ? 100 : 1,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Merriweather',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
