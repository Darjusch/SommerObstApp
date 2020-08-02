import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sommerobst_app_beta/screens/admin/admin_panel_screen.dart';
import 'package:sommerobst_app_beta/screens/auth_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize = Size.fromHeight(50);

  Future<String> check_for_privilege() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String email = user.email.toString();
    return email;
  }

  void logOut(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AuthScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: 'GK Sommerobst', style: TextStyle(color: Colors.white, fontSize: 20,)),
                WidgetSpan(
                  child: Image.asset(
                    'assets/images/placeholder_logo.png',
                    height: 15,
                  ),
                )
              ]
            )
      ),
      actions: [
        Container(
          child: DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(children: <Widget>[
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ]),
                ),
                value: 'logout',
              ),
              DropdownMenuItem(
                child: Container(
                  child: Row(children: <Widget>[
                    Icon(Icons.account_balance),
                    SizedBox(width: 8),
                    Text('Admin'),
                  ]),
                ),
                value: 'admin',
              ),
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                logOut(context);
              }
              if (itemIdentifier == 'admin') {
                check_for_privilege().then((value) {
                  if (value == 'admin@admin.de') {
                    print("CLICKED");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminPanelScreen(),
                      ),
                    );
                  }
                });
              }
            },
          ),
        ),
      ],
    );
  }
}
