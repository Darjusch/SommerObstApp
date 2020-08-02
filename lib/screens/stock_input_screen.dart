import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sommerobst_app_beta/screens/image_upload_screen.dart';
import '../widgets/custom_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StockInputScreen extends StatefulWidget {
  final String standName;

  StockInputScreen({@required this.standName});

  @override
  _StockInputScreenState createState() =>
      _StockInputScreenState(standName: this.standName);
}

class _StockInputScreenState extends State<StockInputScreen> {
  List<String> gridItems = [];
  final String standName;

  _StockInputScreenState({this.standName});

  Map<String, dynamic> gridData = {};
  String currentDate = DateFormat('yMEd').format(DateTime.now());

  void fillGridWithData() {
    print(standName);
    currentDate = currentDate.replaceAll('/', '.');
    setState(() {
      gridData = {
        standName: {
          'erdbeeren': {
            'erdbeerenAB': erdbeerenABController.text,
            'erdbeeren13Uhr': erdbeeren13UhrController.text,
            'erdbeeren15Uhr': erdbeeren15UhrController.text,
            'erdbeeren17Uhr': erdbeeren17UhrController.text,
            'erdbeerenEB': erdbeerenEBController.text,
          },
          'erdbeerenGestern': {
            'erdbeerenGesternAB': erdbeerenGesternABController.text,
            'erdbeerenGestern13Uhr': erdbeerenGestern13UhrController.text,
            'erdbeerenGestern15Uhr': erdbeerenGestern15UhrController.text,
            'erdbeerenGestern17Uhr': erdbeerenGestern17UhrController.text,
            'erdbeerenGesternEB': erdbeerenGesternEBController.text,
          },
          'spargelVio': {
            'spargelVioAB': spargelVioABController.text,
            'spargelVio13Uhr': spargelVio13UhrController.text,
            'spargelVio15Uhr': spargelVio15UhrController.text,
            'spargelVio17Uhr': spargelVio17UhrController.text,
            'spargelVioEB': spargelVioEBController.text,
          },
          'spargelVioGestern': {
            'spargelVioABGestern': spargelVioGesternABController.text,
            'spargelVio13UhrGestern': spargelVioGestern13UhrController.text,
            'spargelVio15UhrGestern': spargelVioGestern15UhrController.text,
            'spargelVio17UhrGestern': spargelVioGestern17UhrController.text,
            'spargelVioEBGestern': spargelVioGesternEBController.text,
          },
          'spargelWeiss': {
            'spargelWeissAB': spargelWeissABController.text,
            'spargelWeiss13Uhr': spargelWeiss13UhrController.text,
            'spargelWeiss15Uhr': spargelWeiss15UhrController.text,
            'spargelWeiss17Uhr': spargelWeiss17UhrController.text,
            'spargelWeissEB': spargelWeissEBController.text,
          },
          'spargelWeissGestern': {
            'spargelWeissGesternAB': spargelWeissGesternABController.text,
            'spargelWeissGestern13Uhr': spargelWeissGestern13UhrController.text,
            'spargelWeissGestern15Uhr': spargelWeissGestern15UhrController.text,
            'spargelWeissGestern17Uhr': spargelWeissGestern17UhrController.text,
            'spargelWeissGesternEB': spargelWeissGesternEBController.text,
          },
          'kirsche690': {
            'kirsche690AB': kirsche690ABController.text,
            'kirsche69013Uhr': kirsche69013UhrController.text,
            'kirsche69015Uhr': kirsche69015UhrController.text,
            'kirsche69017Uhr': kirsche69017UhrController.text,
            'kirsche690EB': kirsche690EBController.text,
          },
          'kirsche790': {
            'kirsche790AB': kirsche790ABController.text,
            'kirsche79013Uhr': kirsche79013UhrController.text,
            'kirsche79015Uhr': kirsche79015UhrController.text,
            'kirsche79017Uhr': kirsche79017UhrController.text,
            'kirsche790EB': kirsche790EBController.text,
          },
          'kirsche890': {
            'kirsche890AB': kirsche890ABController.text,
            'kirsche89013Uhr': kirsche89013UhrController.text,
            'kirsche89015Uhr': kirsche89015UhrController.text,
            'kirsche89017Uhr': kirsche89017UhrController.text,
            'kirsche890EB': kirsche890EBController.text,
          },
          'kirsche1090': {
            'kirsche1090AB': kirsche1090ABController.text,
            'kirsche109013Uhr': kirsche109013UhrController.text,
            'kirsche109015Uhr': kirsche109015UhrController.text,
            'kirsche109017Uhr': kirsche109017UhrController.text,
            'kirsche1090EB': kirsche1090EBController.text,
          },
        }
      };
    });

    addDataToFirestore();
  }

  void addDataToFirestore() {
    Firestore.instance
        .collection('Stände/Testing/' + currentDate)
        .document(standName)
        .setData(gridData);
  }

  var imageDescriptionController = TextEditingController();

  var erdbeerenABController = TextEditingController();
  var erdbeeren13UhrController = TextEditingController();
  var erdbeeren15UhrController = TextEditingController();
  var erdbeeren17UhrController = TextEditingController();
  var erdbeerenEBController = TextEditingController();

  var erdbeerenGesternABController = TextEditingController();
  var erdbeerenGestern13UhrController = TextEditingController();
  var erdbeerenGestern15UhrController = TextEditingController();
  var erdbeerenGestern17UhrController = TextEditingController();
  var erdbeerenGesternEBController = TextEditingController();

  var spargelVioABController = TextEditingController();
  var spargelVio13UhrController = TextEditingController();
  var spargelVio15UhrController = TextEditingController();
  var spargelVio17UhrController = TextEditingController();
  var spargelVioEBController = TextEditingController();

  var spargelVioGesternABController = TextEditingController();
  var spargelVioGestern13UhrController = TextEditingController();
  var spargelVioGestern15UhrController = TextEditingController();
  var spargelVioGestern17UhrController = TextEditingController();
  var spargelVioGesternEBController = TextEditingController();

  var spargelWeissABController = TextEditingController();
  var spargelWeiss13UhrController = TextEditingController();
  var spargelWeiss15UhrController = TextEditingController();
  var spargelWeiss17UhrController = TextEditingController();
  var spargelWeissEBController = TextEditingController();

  var spargelWeissGesternABController = TextEditingController();
  var spargelWeissGestern13UhrController = TextEditingController();
  var spargelWeissGestern15UhrController = TextEditingController();
  var spargelWeissGestern17UhrController = TextEditingController();
  var spargelWeissGesternEBController = TextEditingController();

  var kirsche690ABController = TextEditingController();
  var kirsche69013UhrController = TextEditingController();
  var kirsche69015UhrController = TextEditingController();
  var kirsche69017UhrController = TextEditingController();
  var kirsche690EBController = TextEditingController();

  var kirsche790ABController = TextEditingController();
  var kirsche79013UhrController = TextEditingController();
  var kirsche79015UhrController = TextEditingController();
  var kirsche79017UhrController = TextEditingController();
  var kirsche790EBController = TextEditingController();

  var kirsche890ABController = TextEditingController();
  var kirsche89013UhrController = TextEditingController();
  var kirsche89015UhrController = TextEditingController();
  var kirsche89017UhrController = TextEditingController();
  var kirsche890EBController = TextEditingController();

  var kirsche1090ABController = TextEditingController();
  var kirsche109013UhrController = TextEditingController();
  var kirsche109015UhrController = TextEditingController();
  var kirsche109017UhrController = TextEditingController();
  var kirsche1090EBController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                widget.standName,
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            height: 400,
            padding: EdgeInsets.only(bottom: 30),
            child: GridView.count(
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 6,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('AB'),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('13 Uhr'),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('15 Uhr'),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('17 Uhr'),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('EB'),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Erd'),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: erdbeerenABController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: erdbeeren13UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: erdbeeren15UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: erdbeeren17UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: erdbeerenEBController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Erd G'),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: erdbeerenGesternABController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: erdbeerenGestern13UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: erdbeerenGestern15UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: erdbeerenGestern17UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: erdbeerenGesternEBController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('S Vio'),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelVioABController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelVio13UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelVio15UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelVio17UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelVioEBController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('S Vio G'),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelVioGesternABController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelVioGestern13UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelVioGestern15UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelVioGestern17UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelVioGesternEBController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('SW'),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelWeissABController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelWeiss13UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelWeiss15UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelWeiss17UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelWeissEBController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('SW G'),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelWeissGesternABController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelWeissGestern13UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelWeissGestern15UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelWeissGestern17UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: spargelWeissGesternEBController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('K 6,90'),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche690ABController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche69013UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche69015UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche69017UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche690EBController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('K 7,90'),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche790ABController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche79013UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche79015UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche79017UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche790EBController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('K 8,90'),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche890ABController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche89013UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche89015UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche89017UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche890EBController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('K 10,90'),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche1090ABController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche109013UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche109015UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche109017UhrController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: kirsche1090EBController,
                    keyboardType: TextInputType.number,
                  ),
                  color: Colors.blue[500],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 40),
            child: FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              onPressed: () => {
                fillGridWithData(),
              },
              child: Text(
                'Save Data',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageUploadScreen(
                standName: standName,
              ),
            ),
          )
        },
        child: Icon(Icons.image),
      ),
    );
  }
}
