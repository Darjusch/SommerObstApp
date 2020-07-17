import 'package:flutter/material.dart';
import 'package:sommerobst_app_beta/screens/admin/admin_single_stand.dart';
import 'package:sommerobst_app_beta/widgets/app_bar_row.dart';
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
            style: TextStyle(fontSize: 25),
          ),
          Container(
            height: 600,
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
