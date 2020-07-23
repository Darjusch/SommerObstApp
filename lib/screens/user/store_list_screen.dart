import 'package:flutter/material.dart';
import 'package:sommerobst_app_beta/widgets/custom_button.dart';
import '../../widgets/custom_app_bar.dart';
import 'selected_store_list_screen.dart';
import '../../widgets/date.dart';
import '../stock_input_screen.dart';
import '../remaining_stock_screen.dart';

class StoreListScreen extends StatefulWidget {
  @override
  _StoreListScreenState createState() => _StoreListScreenState();
}

class _StoreListScreenState extends State<StoreListScreen> {
  bool isClicked = false;

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
          builder: (context) => StockInputScreen(
            standName: selectedStands[0],
          ),
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
      appBar: CustomAppBar(),

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
              style: TextStyle(fontSize: 21),
            ),
          ),
          Container(
            height: 400,
            child: ListView.builder(
                itemCount: stands.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(3.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: selectedStands.contains(stands[index])
                          ? Colors.red
                          : Colors.blue,
                      onPressed: () {
                        setState(() {
                          if (selectedStands.contains(stands[index])) {
                            selectedStands.remove(stands[index]);
                          } else {
                            selectedStands.add(stands[index]);
                          }
                        });
                      },
                      child: Text(
                        stands[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          CustomButton(
            buttonName: 'Restbestand',
            nextScreenName: RemainingStockScreen(),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () => {showNextScreen(context)},
      ),
    );
  }
}
