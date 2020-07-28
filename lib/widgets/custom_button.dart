import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget nextScreenName;
  final String buttonName;

  CustomButton({
    @required this.buttonName,
    @required this.nextScreenName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        padding: const EdgeInsets.all(3.0),
        color: Colors.blue,
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextScreenName),
          )
        },
        child: Text(
          buttonName,
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
