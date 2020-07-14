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
            top: 20,
            right: 20,
            bottom: 20,
          ),
          child: Text(
            DateFormat('yMEd').format(DateTime.now()),
            style: TextStyle(fontSize: 25),
          ),
        ),
      ],
    );
  }
}
