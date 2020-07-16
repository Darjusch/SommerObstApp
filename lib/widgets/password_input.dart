import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Bitte gebe deinen Password ein',
          labelStyle: TextStyle(fontSize: 21)),
      controller: passwordController,
      obscureText: true,
    );
  }
}
