import 'package:flutter/material.dart';

class NameInput extends StatefulWidget {
  @override
  _NameInputState createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Bitte gebe deinen Namen ein',
          labelStyle: TextStyle(fontSize: 24)),
      controller: nameController,
    );
  }
}
