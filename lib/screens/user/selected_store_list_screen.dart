import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/stand_creation.dart';
import '../stock_input_screen.dart';
import '../../widgets/date.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SelectedStoreListScreen extends StatelessWidget {
  final List<String> selectedStands;

  SelectedStoreListScreen(this.selectedStands);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          Date(),
          Text(
            'Deine/n Stände/Stand',
            style: TextStyle(fontSize: 25),
          ),
          Container(
            height: 600,
            child: ListView.builder(
                itemCount: selectedStands.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                      left: 3,
                      right: 3,
                    ),
                    child: StandCreation(
                      stand: selectedStands[index],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StockInputScreen(
                              standName: selectedStands[index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
