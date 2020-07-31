import 'package:cloud_firestore/cloud_firestore.dart';
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
      CollectionReference _documentRef = Firestore.instance
          .collection('Stände')
          .document('Testing')
          .collection(currentDate)
          .document(standName)
          .collection('images');
      Image img;
      List<Widget> imgList = [];
      var ds = await _documentRef.getDocuments();
      for (var doc in ds.documents) {
        var downloadUrl = await FireStorageService.loadImage(
          context,
          '/Stände/' + standName + '/' + currentDate + '/hallo.jpg',
        );
        img = Image.network(
          downloadUrl.toString(),
          fit: BoxFit.scaleDown,
        );
        imgList.add(img);
      }
      // Now function is returning a widget
      return ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return imgList[index];
        },
      );
    } catch (err) {
      print(err);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        height: 800,
        width: 400,
        child: Column(children: <Widget>[
          Text(
            widget.standName,
            style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: FutureBuilder(
              future: _getImage(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done)
                  return SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 1.25,
                          width: MediaQuery.of(context).size.width / 1.25,
                          child: snapshot.data,
                        ),
                      ],
                    ),
                  );
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Container(
                      height: MediaQuery.of(context).size.height / 1.25,
                      width: MediaQuery.of(context).size.width / 1.25,
                      child: CircularProgressIndicator());

                return Container(child: Text('some error'));
              },
            ),
          ),
        ]),
      ),
    );
  }
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();

  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
