import 'package:flutter/material.dart';
import 'package:sommerobst_app_beta/screens/admin/admin_create_user.dart';
import 'package:sommerobst_app_beta/screens/admin/admin_single_stand.dart';
import 'package:sommerobst_app_beta/screens/load_data_screen.dart';
import 'package:sommerobst_app_beta/widgets/app_bar_row.dart';
import 'package:sommerobst_app_beta/widgets/custom_button.dart';
import 'package:sommerobst_app_beta/widgets/date.dart';
import 'package:sommerobst_app_beta/widgets/stand_creation.dart';

import '../remaining_stock_screen.dart';

class AdminPanelScreen extends StatelessWidget {
  final List<String> stands = [
    'Rugenbarg',
    'Altona ZOB',
    'Blankenese',
    'Neue Flora',
    'Holstenstraße'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarRow(),
      ),
      body: Column(
        children: <Widget>[
          Date(),
          Text(
            'Administrative übersicht',
            style: TextStyle(fontSize: 22),
          ),
          Container(
            height: 300,
            child: ListView.builder(
                itemCount: stands.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                      left: 3,
                      right: 3,
                    ),
                    child: StandCreation(
                      stand: stands[index],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AdminSingleStand(stand: stands[index]),
                          ),
                        );
                      },
                    ),
                  );
                }),
          ),
          CustomButton(
            buttonName: 'Downloads',
            nextScreenName: LoadDataScreen(),
          ),
          CustomButton(
            buttonName: 'Stände hinzufügen/löschen',
            nextScreenName: RemainingStockScreen(),
          ),
          CustomButton(
            buttonName: 'Fahrer hinzufügen/löschen',
            nextScreenName: AdminCreateUser(),
          ),
          CustomButton(
            buttonName: 'Verkäufer hinzufügen/löschen',
            nextScreenName: AdminCreateUser(),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              padding: const EdgeInsets.all(3.0),
              color: Colors.blue,
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RemainingStockScreen()),
                )
              },
              child: Text(
                'Restbestand',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
