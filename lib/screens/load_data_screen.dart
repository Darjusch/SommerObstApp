import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sommerobst_app_beta/widgets/app_bar_row.dart';

class LoadDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBarRow()),
      body: StreamBuilder(
          stream: Firestore.instance
          .collection('Stände')
          .document('Testing')
          .collection('Tue, 7.21.2020')
          .document('Holstenstraße')
              .snapshots(),
          builder: (context, snapshot){
       if(!snapshot.hasData) return Text('Loading data.. Please Wait..');
       return Column(
         children: <Widget>[
           Text(snapshot.data['Holstenstraße']['erdbeeren']['erdbeeren13Uhr'], style: TextStyle(fontSize: 40),),
         ]
       );
    })
    );
  }
}
