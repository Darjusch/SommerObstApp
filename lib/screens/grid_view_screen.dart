import 'package:flutter/material.dart';
import '../widgets/app_bar_row.dart';

class GridViewScreen extends StatefulWidget {
  String standName;
  GridViewScreen(this.standName);

  @override
  _GridViewScreenState createState() =>
      _GridViewScreenState(standName: this.standName);
}

class _GridViewScreenState extends State<GridViewScreen> {
  List<String> gridItems = [];
  final String standName;
  _GridViewScreenState({this.standName});

  Map gridData = {};

  void fillGridWithData() {
    print(standName);
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
        }
      }
    };
    print(gridData);
    print(erdbeeren13UhrController.text);
  }

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
      appBar: AppBar(
        title: AppBarRow(),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                widget.standName,
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
              ),
              FloatingActionButton(onPressed: () => {fillGridWithData()})
            ],
          ),
          Container(
            height: 350,
            child: GridView.count(
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 6,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.blue[700],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('AB'),
                  color: Colors.blue[900],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('13 Uhr'),
                  color: Colors.blue[900],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('15 Uhr'),
                  color: Colors.blue[900],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('17 Uhr'),
                  color: Colors.blue[900],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('EB'),
                  color: Colors.blue[900],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Erd'),
                  color: Colors.blue[900],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: erdbeerenABController),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: erdbeeren13UhrController),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: erdbeeren15UhrController),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: erdbeeren17UhrController),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: erdbeerenEBController),
                  color: Colors.blue[600],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Erd G'),
                  color: Colors.blue[900],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: erdbeerenGesternABController),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: erdbeerenGestern13UhrController),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: erdbeerenGestern15UhrController),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: erdbeerenGestern17UhrController),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: erdbeerenGesternEBController),
                  color: Colors.blue[600],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('S Vio'),
                  color: Colors.blue[900],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelVioABController),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelVio13UhrController),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelVio15UhrController),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelVio17UhrController),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelVioEBController),
                  color: Colors.blue[600],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('S Vio G'),
                  color: Colors.blue[900],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelVioGesternABController),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child:
                      TextField(controller: spargelVioGestern13UhrController),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child:
                      TextField(controller: spargelVioGestern15UhrController),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child:
                      TextField(controller: spargelVioGestern17UhrController),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelVioGesternEBController),
                  color: Colors.blue[600],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('SW'),
                  color: Colors.blue[900],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelWeissABController),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelWeiss13UhrController),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelWeiss15UhrController),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelWeiss17UhrController),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelWeissEBController),
                  color: Colors.blue[600],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('SW G'),
                  color: Colors.blue[900],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelWeissGesternABController),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child:
                      TextField(controller: spargelWeissGestern13UhrController),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child:
                      TextField(controller: spargelWeissGestern15UhrController),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child:
                      TextField(controller: spargelWeissGestern17UhrController),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelWeissGesternEBController),
                  color: Colors.blue[600],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('K 6,90'),
                  color: Colors.blue[900],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche690ABController),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche69013UhrController),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche69015UhrController),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche69017UhrController),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche690EBController),
                  color: Colors.blue[600],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('K 7,90'),
                  color: Colors.blue[900],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche790ABController),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche79013UhrController),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche79015UhrController),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche79017UhrController),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche790EBController),
                  color: Colors.blue[600],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('K 8,90'),
                  color: Colors.blue[900],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche890ABController),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche89013UhrController),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche89015UhrController),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche89017UhrController),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche890EBController),
                  color: Colors.blue[600],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('K 10,90'),
                  color: Colors.blue[900],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche1090ABController),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche109013UhrController),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche109015UhrController),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche109017UhrController),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirsche1090EBController),
                  color: Colors.blue[600],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
