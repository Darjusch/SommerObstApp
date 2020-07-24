import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {

              return StoreListScreen();
            }
            return AuthScreen();
          }),
    );
  }
}
