import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sommerobst_app_beta/screens/admin/admin_single_stand.dart';
import 'package:sommerobst_app_beta/widgets/custom_button.dart';
import 'package:sommerobst_app_beta/widgets/stand_creation.dart';
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
          SingleChildScrollView(
            child: Container(
              height: 500,
              width: 400,
              child: StreamBuilder(
                  stream:
                      Firestore.instance.collection('Standnamen').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return new Text("Loading");
                    } else {
                      List<Container> standItems = [];
                      for (int i = 0; i < snapshot.data.documents.length; i++) {
                        DocumentSnapshot snap = snapshot.data.documents[i];
                        standItems.add(Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(3.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: selectedStands.contains(snap.documentID)
                                ? Colors.red
                                : Colors.blue,
                            onPressed: () {
                              setState(() {
                                if (selectedStands.contains(snap.documentID)) {
                                  selectedStands.remove(snap.documentID);
                                } else {
                                  selectedStands.add(snap.documentID);
                                }
                              });
                            },
                            child: Text(
                              snap.documentID,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ));
                      }
                      return ListView.builder(
                          itemCount: standItems.length,
                          itemBuilder: (context, index) {
                            return standItems[index];
                          });
                    }
                  }),
            ),
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
