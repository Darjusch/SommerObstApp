import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sommerobst_app_beta/widgets/custom_app_bar.dart';
import 'package:sommerobst_app_beta/widgets/date.dart';
import 'package:sommerobst_app_beta/widgets/stand_creation.dart';

import 'admin_single_stand.dart';

class AdminStandOverviewScreen extends StatefulWidget {
  @override
  _AdminStandOverviewScreenState createState() =>
      _AdminStandOverviewScreenState();
}

class _AdminStandOverviewScreenState extends State<AdminStandOverviewScreen> {

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
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 160,
              width: MediaQuery.of(context).size.height - 20,
              child: StreamBuilder(
                  stream: Firestore.instance.collection('Standnamen').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return new Text("Loading");
                    } else {
                      List<StandCreation> standItems = [];
                      for (int i = 0; i < snapshot.data.documents.length; i++) {
                        DocumentSnapshot snap = snapshot.data.documents[i];
                        standItems.add(
                            StandCreation(
                              stand: snap.documentID,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdminSingleStand(
                                      stand:
                                      snap.documentID,
                                    ),
                                  ),
                                );
                              },
                            )
                        );
                      }
                      return ListView.builder(
                          itemCount: standItems.length,
                          itemBuilder: (context, index) {
                            return standItems[index];
                          });
                    }
                  }),
            ),
          )
        ]));
  }
}
