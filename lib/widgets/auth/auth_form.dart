import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isAdmin);

  final bool isAdmin;
  final void Function(String emailAddress, String username, String password)
      submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _emailAddress = '';
  String _userName = '';
  String _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        _emailAddress,
        _userName,
        _userPassword,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  key: ValueKey('email'),
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid emailadress';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Email address'),
                  onSaved: (value) {
                    _emailAddress = value;
                  },
                ),
                TextFormField(
                  key: ValueKey('username'),
                  validator: (value) {
                    if (value.isEmpty || value.length < 4) {
                      return 'Please enter at least 4 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                  onSaved: (value) {
                    _userName = value;
                  },
                ),
                TextFormField(
                  key: ValueKey('password'),
                  validator: (value) {
                    if (value.isEmpty || value.length < 7) {
                      return 'Password must be at least 7 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  onSaved: (value) {
                    _userPassword = value;
                  },
                ),
                SizedBox(height: 12),
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(120)),
                  child: widget.isAdmin
                      ? Text(
                          'Create new User',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                  onPressed: _trySubmit,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
