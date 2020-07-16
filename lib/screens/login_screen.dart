import 'package:flutter/material.dart';
import 'package:sommerobst_app_beta/screens/store_list_screen.dart';
import 'package:sommerobst_app_beta/widgets/app_bar_row.dart';
import 'package:sommerobst_app_beta/widgets/date.dart';
import 'package:sommerobst_app_beta/widgets/name_input.dart';
import 'package:sommerobst_app_beta/widgets/password_input.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarRow(),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Date(),
            Spacer(flex: 1),
            Text('Login', style: TextStyle(fontSize: 30)),
            NameInput(),
            PasswordInput(),
            Spacer(flex: 2),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StoreListScreen(),
            ),
          );
        },
      ),
    );
  }
}
