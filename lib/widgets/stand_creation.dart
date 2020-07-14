import 'package:flutter/material.dart';

class StandCreation extends StatelessWidget {
  final String stand;
  final VoidCallback onPressed;
  StandCreation({this.stand, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 5,
          bottom: 5,
        ),
        padding: const EdgeInsets.all(3.0),
        color: Colors.blue,
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
