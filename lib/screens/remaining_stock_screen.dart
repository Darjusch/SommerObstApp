import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

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
      resizeToAvoidBottomPadding: false,
      appBar: CustomAppBar(),
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
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 200,
              width: double.infinity,
              child: GridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 2,
                childAspectRatio: 3 / 1,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(''),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text('Restb.'),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text('Erd'),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TextField(controller: erdbeerenRestbestand, keyboardType: TextInputType.number,),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text('Erd G'),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TextField(controller: erdbeerenGesternRestbestand, keyboardType: TextInputType.number,),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text('S Vio'),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TextField(controller: spargelVioRestbestand, keyboardType: TextInputType.number,),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text('S Vio G'),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TextField(controller: spargelGesternVioRestbestand, keyboardType: TextInputType.number,),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text('S W'),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TextField(controller: spargelWeissRestbestand, keyboardType: TextInputType.number,),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text('S W G'),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TextField(controller: spargelGesternWeissRestbestand, keyboardType: TextInputType.number,),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text('K 6,90'),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TextField(controller: kirschen690Restbestand, keyboardType: TextInputType.number,),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text('K 7,90'),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TextField(controller: kirschen790Restbestand, keyboardType: TextInputType.number,),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text('K 8,90'),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TextField(controller: kirschen890Restbestand, keyboardType: TextInputType.number,),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text('K 10,90'),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TextField(controller: kirschen1090Restbestand, keyboardType: TextInputType.number,),
                    color: Colors.blue[300],
                  ),
                ],
              ),
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
