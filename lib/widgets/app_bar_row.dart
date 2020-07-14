import 'package:flutter/material.dart';

class AppBarRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('GK Sommerobst'),
        Container(
          height: 50,
          child: Image.asset(
            'assets/images/placeholder_logo.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
