import 'package:flutter/material.dart';
import 'package:sommerobst_app_beta/widgets/app_bar_row.dart';
import 'package:sommerobst_app_beta/widgets/custom_button.dart';

import '../remaining_stock_screen.dart';
import '../stock_input_screen.dart';

class AdminSingleStand extends StatelessWidget {
  String stand;

  AdminSingleStand({@required this.stand});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppBarRow(),
        ),
        body: Column(
          children: <Widget>[
            Text(
              stand,
              style: TextStyle(fontSize: 25),
            ),
            CustomButton(
              buttonName: 'Bestände',
              nextScreenName: StockInputScreen(
                standName: stand,
              ),
            ),
            CustomButton(
              buttonName: 'Restbestände',
              nextScreenName: RemainingStockScreen(),
            ),
            CustomButton(
              buttonName: 'Push-Nachrichten',
              nextScreenName: StockInputScreen(
                standName: stand,
              ),
            ),
            CustomButton(
              buttonName: 'Fotos',
              nextScreenName: StockInputScreen(
                standName: stand,
              ),
            ),
          ],
        ));
  }
}
