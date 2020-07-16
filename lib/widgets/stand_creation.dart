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
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30.0),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(3.0),
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
