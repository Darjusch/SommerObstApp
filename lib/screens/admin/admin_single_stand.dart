import 'package:flutter/material.dart';
import 'package:sommerobst_app_beta/screens/admin/admin_image_view.dart';
import 'package:sommerobst_app_beta/widgets/custom_app_bar.dart';
import 'package:sommerobst_app_beta/widgets/custom_button.dart';

import '../stock_input_screen.dart';
import 'admin_push_notification_screen.dart';

class AdminSingleStand extends StatelessWidget {
  final String stand;

  AdminSingleStand({@required this.stand});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),

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
              buttonName: 'Fotos',
              nextScreenName: AdminImageView(standName: stand,),
            ),
            CustomButton(
              buttonName: 'Push-Nachrichten',
              nextScreenName: AdminPushNotificationScreen(
              ),
            ),
          ],
        ));
  }
}
