import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sommerobst_app_beta/screens/admin/adming_panel_screen.dart';
import 'package:sommerobst_app_beta/screens/auth_screen.dart';
import 'package:sommerobst_app_beta/screens/user/store_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GK Sommerobst',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        accentColorBrightness: Brightness.dark,
      ),
      home: _MyHomePage(),
    );
  }
}


class _MyHomePage extends StatelessWidget {

  Future<String> email;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, userSnapshot) {

            if (userSnapshot.hasData) {
              if (userSnapshot.data.email == 'admin@admin.de'){
                return AdminPanelScreen();
              } else {
                return StoreListScreen();
              }
            } else  {
              return AuthScreen();
            }

          }),
    );
  }
}
