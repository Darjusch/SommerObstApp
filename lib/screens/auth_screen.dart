import 'package:flutter/material.dart';
import 'package:sommerobst_app_beta/screens/admin/admin_panel_screen.dart';
import 'package:sommerobst_app_beta/screens/user/store_list_screen.dart';
import 'package:sommerobst_app_beta/widgets/auth/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(
    String email,
    String job,
    String password,
  ) async {
    AuthResult authResult;
    authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String currentEmail = user.email.toString();

    print(currentEmail);

    if(currentEmail == 'admin@admin.de'){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AdminPanelScreen(),
        ),
      );
    }else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StoreListScreen(),
        ),
      );    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: AuthForm(_submitAuthForm, false),
    );
  }
}
