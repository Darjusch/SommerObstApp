import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sommerobst_app_beta/widgets/custom_app_bar.dart';
import 'package:sommerobst_app_beta/widgets/auth/auth_form.dart';

class AdminCreateUser extends StatefulWidget {
  @override
  _AdminCreateUserState createState() => _AdminCreateUserState();
}

class _AdminCreateUserState extends State<AdminCreateUser> {
  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(
    String email,
    String username,
    String password,
  ) async {
    AuthResult authResult;
    try {
      authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on PlatformException catch (err) {
      var message = 'An error occured please check your credentials!';
      if (err.message != null) {
        message = err.message;
        print(message);
      }
    } catch (err) {
      print(err);
    }
    await Firestore.instance.collection('users').document(authResult.user.uid).setData({
      'username': username,
      'email': email,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.blue,
      body: AuthForm(_submitAuthForm, true),
    );
  }
}
