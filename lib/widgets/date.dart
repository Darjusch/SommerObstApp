import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 10,
            right: 20,
            bottom: 10,
          ),
          child: Text(
            DateFormat('yMEd').format(DateTime.now()),
            style: TextStyle(fontSize: 21),
          ),
        ),
      ],
    );
  }
}
