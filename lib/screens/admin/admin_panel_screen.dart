import 'package:flutter/material.dart';
import 'package:sommerobst_app_beta/screens/admin/admin_create_stand_screen.dart';
import 'package:sommerobst_app_beta/screens/admin/admin_create_user.dart';
import 'package:sommerobst_app_beta/widgets/custom_app_bar.dart';
import 'package:sommerobst_app_beta/widgets/custom_button.dart';
import 'package:sommerobst_app_beta/widgets/date.dart';

import '../remaining_stock_screen.dart';
import 'admin_stand_overview_screen.dart';

class AdminPanelScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          Date(),
          Text(
            'Adminpanel',
            style: TextStyle(fontSize: 22),
          ),
          CustomButton(
            buttonName: 'Standübersicht',
            nextScreenName: AdminStandOverviewScreen(),
          ),
          CustomButton(
            buttonName: 'Stände hinzufügen/löschen',
            nextScreenName: AdminCreateStandScreen(),
          ),
          CustomButton(
            buttonName: 'User hinzufügen/löschen',
            nextScreenName: AdminCreateUser(),
          ),
          CustomButton(
            buttonName: 'Restbestand',
            nextScreenName: RemainingStockScreen(),
          ),
        ],
      ),
    );
  }
}
