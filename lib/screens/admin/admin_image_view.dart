import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:sommerobst_app_beta/widgets/custom_app_bar.dart';

class AdminImageView extends StatefulWidget {
  String standName;

  AdminImageView({@required this.standName});

  @override
  _AdminImageViewState createState() =>
      _AdminImageViewState(standName: this.standName);
}

class _AdminImageViewState extends State<AdminImageView> {
  String standName;
  String currentDate = DateFormat('yMEd').format(DateTime.now());

  _AdminImageViewState({@required this.standName});

  Future<Widget> _getImage(BuildContext context) async {
    try {
      currentDate = currentDate.replaceAll('/', '.');
      Image m;
      await FireStorageService.loadImage(
              context,
              '/Stände/' +
                  standName +
                  '/' +
                  currentDate +
                  '/image_name_placeholder.jpg')
          .then((downloadUrl) {
        m = Image.network(
          downloadUrl.toString(),
          fit: BoxFit.scaleDown,
        );
      });
      return m;
    } catch (err) {
      print(err);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(children: <Widget>[
        Text(
          widget.standName,
          style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: FutureBuilder(
            future: _getImage(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done)
                return Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 125),
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
