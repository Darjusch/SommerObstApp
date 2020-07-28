import 'package:flutter/material.dart';
import 'package:sommerobst_app_beta/widgets/custom_app_bar.dart';
import 'package:sommerobst_app_beta/widgets/date.dart';
import 'package:sommerobst_app_beta/widgets/stand_creation.dart';

import 'admin_single_stand.dart';

class AdminStandOverviewScreen extends StatelessWidget {
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
        appBar: CustomAppBar(),
        body: Column(children: <Widget>[
          Date(),
          Container(
            padding: EdgeInsets.only(
              left: 3,
              right: 3,
            ),
            child: Text(
              'Standübersicht',
              style: TextStyle(fontSize: 21),
            ),
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
          )
        ]));
  }
}
