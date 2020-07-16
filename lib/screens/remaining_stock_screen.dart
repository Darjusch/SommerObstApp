import 'package:flutter/material.dart';
import '../widgets/app_bar_row.dart';

class RemainingStockScreen extends StatefulWidget {
  @override
  _RemainingStockScreenState createState() => _RemainingStockScreenState();
}

class _RemainingStockScreenState extends State<RemainingStockScreen> {
  Map remainingStockData = {};

  void fillRemainingStockWithData() {
    setState(() {
      remainingStockData = {
        'Restbestand': {
          'erdbeeren': erdbeerenRestbestand.text,
          'erdbeerenGestern': erdbeerenGesternRestbestand.text,
          'spargelVio': spargelVioRestbestand.text,
          'spargelGesternVio': spargelGesternVioRestbestand.text,
          'spargelWeiss': spargelWeissRestbestand.text,
          'spargelGesternWeiss': spargelGesternWeissRestbestand.text,
          'kirschen690': kirschen690Restbestand.text,
          'kirschen790': kirschen790Restbestand.text,
          'kirschne890': kirschen890Restbestand.text,
          'kirschen1090': kirschen1090Restbestand.text,
        }
      };
    });
    print(remainingStockData);
  }

  var erdbeerenRestbestand = TextEditingController();
  var erdbeerenGesternRestbestand = TextEditingController();
  var spargelVioRestbestand = TextEditingController();
  var spargelGesternVioRestbestand = TextEditingController();
  var spargelWeissRestbestand = TextEditingController();
  var spargelGesternWeissRestbestand = TextEditingController();
  var kirschen690Restbestand = TextEditingController();
  var kirschen790Restbestand = TextEditingController();
  var kirschen890Restbestand = TextEditingController();
  var kirschen1090Restbestand = TextEditingController();

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
                'Restbestand',
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            height: 500,
            width: double.infinity,
            child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              childAspectRatio: 3 / 1,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(''),
                  color: Colors.blue[900],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text('Restb.'),
                  color: Colors.blue[700],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text('Erd'),
                  color: Colors.blue[800],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: erdbeerenRestbestand),
                  color: Colors.blue[700],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text('Erd G'),
                  color: Colors.blue[800],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: erdbeerenGesternRestbestand),
                  color: Colors.blue[600],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text('S Vio'),
                  color: Colors.blue[700],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelVioRestbestand),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text('S Vio G'),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelGesternVioRestbestand),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text('S W'),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelWeissRestbestand),
                  color: Colors.blue[100],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text('S W G'),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: spargelGesternWeissRestbestand),
                  color: Colors.blue[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text('K 690'),
                  color: Colors.blue[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirschen690Restbestand),
                  color: Colors.blue[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text('K 790'),
                  color: Colors.blue[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirschen790Restbestand),
                  color: Colors.blue[600],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text('K 890'),
                  color: Colors.blue[700],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirschen890Restbestand),
                  color: Colors.blue[800],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text('K 1090'),
                  color: Colors.blue[600],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(controller: kirschen1090Restbestand),
                  color: Colors.blue[500],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 30, right: 40),
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () => {
                    fillRemainingStockWithData(),
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
