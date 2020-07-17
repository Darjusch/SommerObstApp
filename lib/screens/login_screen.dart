import 'package:flutter/material.dart';
import 'package:sommerobst_app_beta/screens/admin/adming_panel_screen.dart';
import 'package:sommerobst_app_beta/screens/user/store_list_screen.dart';
import 'package:sommerobst_app_beta/widgets/app_bar_row.dart';
import 'package:sommerobst_app_beta/widgets/date.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map users = {
    'Verkäufer': ['Henning'],
    'Fahrer': ['Max'],
    'Admin': ['Darjusch'],
  };

  final nameController = TextEditingController();
  final passwordController = TextEditingController();

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
            TextField(
              decoration: InputDecoration(
                  labelText: 'Bitte gebe deinen Namen ein',
                  labelStyle: TextStyle(fontSize: 21)),
              controller: nameController,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Bitte gebe deinen Password ein',
                  labelStyle: TextStyle(fontSize: 21)),
              controller: passwordController,
              obscureText: true,
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () {
          if (users['Verkäufer'].contains(nameController.text) ||
              users['Fahrer'].contains(nameController.text)) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StoreListScreen(),
              ),
            );
          } else if (users['Admin'].contains(nameController.text)) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdminPanelScreen()));
          }
          ;
        },
      ),
    );
  }
}
