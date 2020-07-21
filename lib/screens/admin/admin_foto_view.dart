import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:sommerobst_app_beta/widgets/app_bar_row.dart';

class AdminFotoView extends StatefulWidget {
  String standName;

  AdminFotoView({@required this.standName});

  @override
  _AdminFotoViewState createState() =>
      _AdminFotoViewState(standName: this.standName);
}

class _AdminFotoViewState extends State<AdminFotoView> {
  String standName;

  _AdminFotoViewState({@required this.standName});

  /*

  */

  Future<Widget> _getImage(BuildContext context, String image) async {
    Image m;
    await FireStorageService.loadImage(context, image).then((downloadUrl) {
      m = Image.network(
        downloadUrl.toString(),
        fit: BoxFit.scaleDown,
      );
    });
    return m;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarRow(),
      ),
      body: Column(children: <Widget>[
        Text(
          widget.standName,
          style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: FutureBuilder(
            future: _getImage(context, '/Stände/Rugenbarg/Tue, 7.21.2020/image_name_placeholder.jpg'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done)
                return Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 1.25,
                      width: MediaQuery.of(context).size.width / 1.25,
                      child: snapshot.data,
                    ),
                  ],
                );

              if (snapshot.connectionState == ConnectionState.waiting)
                return Container(
                    height: MediaQuery.of(context).size.height / 1.25,
                    width: MediaQuery.of(context).size.width / 1.25,
                    child: CircularProgressIndicator());

              return Container();
            },
          ),
        ),
      ]),
    );
  }
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();

  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
