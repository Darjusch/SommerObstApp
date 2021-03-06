import 'package:flutter/material.dart';

class StandCreation extends StatelessWidget {
  final String stand;
  final VoidCallback onPressed;

  StandCreation({this.stand, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(3.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        color: Colors.blue,
        onPressed: onPressed,
        child: Text(
          stand,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
