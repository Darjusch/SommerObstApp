import 'package:flutter/material.dart';
import '../../widgets/app_bar_row.dart';
import '../../widgets/stand_creation.dart';
import 'selected_store_list_screen.dart';
import '../../widgets/date.dart';
import '../stock_input_screen.dart';
import '../remaining_stock_screen.dart';

class StoreListScreen extends StatefulWidget {
  @override
  _StoreListScreenState createState() => _StoreListScreenState();
}

class _StoreListScreenState extends State<StoreListScreen> {
  final List<String> stands = [
    'Rugenbarg',
    'Altona ZOB',
    'Blankenese',
    'Neue Flora',
    'Holstenstraße'
  ];
  List<String> selectedStands = [];
  void showNextScreen(context) {
    if (selectedStands.length == 0) {
      return;
    } else if (selectedStands.length == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GridViewScreen(selectedStands[0]),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectedStoreListScreen(selectedStands),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarRow(),
      ),
      body: Column(
        children: <Widget>[
          Date(),
          Container(
            padding: EdgeInsets.only(
              left: 3,
              right: 3,
            ),
            child: Text(
              'Bitte wähle deine/n Stände/Stand aus',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            height: 600,
            child: ListView.builder(
                itemCount: stands.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 3,
                      right: 3,
                    ),
                    child: StandCreation(
                      stand: stands[index],
                      onPressed: () {
                        if (!selectedStands.contains(stands[index])) {
                          selectedStands.add(stands[index]);

                          print(selectedStands);
                        } else {
                          selectedStands.remove(stands[index]);
                          print(selectedStands);
                        }
                      },
                    ),
                  );
                }),
          ),
          Container(
              child: InkWell(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RemainingStockScreen()))
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              padding: const EdgeInsets.all(3.0),
              color: Colors.blue,
              child: Text(
                'Restbestand',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () => {showNextScreen(context)},
      ),
    );
  }
}
