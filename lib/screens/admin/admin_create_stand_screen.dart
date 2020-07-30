import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sommerobst_app_beta/widgets/custom_app_bar.dart';
import 'package:sommerobst_app_beta/widgets/date.dart';

class AdminCreateStandScreen extends StatefulWidget {
  @override
  _AdminCreateStandScreenState createState() => _AdminCreateStandScreenState();
}

class _AdminCreateStandScreenState extends State<AdminCreateStandScreen> {

  var selectedStand;
  var standNameController = TextEditingController();

  void createStand() {
    Firestore.instance
        .collection('Standnamen')
        .document(standNameController.text).setData({});
    print("here");
  }

  void deleteStand() {
    DocumentReference ref = Firestore.instance
        .collection('Standnamen')
        .document(selectedStand);
    ref.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Date(),
            Container(
              padding: EdgeInsets.only(
                left: 3,
                right: 3,
              ),
              child: Text(
                'Standübersicht',
                style: TextStyle(fontSize: 21),
              ),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Stand name..'),
              controller: standNameController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(120)),
                  onPressed: createStand,
                  child: Text('Create Stand'),
                ),
              ],
            ),

            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('Standnamen').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading");
                }
                else {
                  List<DropdownMenuItem> standItems = [];
                  for (int i = 0; i < snapshot.data.documents.length; i++) {
                    DocumentSnapshot snap = snapshot.data.documents[i];
                    standItems.add(
                        DropdownMenuItem(
                          child: Text(
                            snap.documentID,
                            style: TextStyle(color: Colors.blue),
                          ),
                          value: "${snap.documentID}",
                        )
                    );
                  }
                  if(standItems.isNotEmpty)
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.add_to_photos, size: 25.0, color: Colors.blue,),
                      SizedBox(width: 50.0,),
                      DropdownButton(
                        items: standItems,
                        onChanged: (standValue) {
                          setState(() {
                            selectedStand = standValue;
                          });
                        },
                        value: selectedStand,
                        isExpanded: false,
                        hint: new Text(
                          "Choose stand to delete",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  );
                  return Text('No stand to delete');
                }
              },
            ),
            RaisedButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(120)),
              onPressed: deleteStand,
              child: Text('Delete Stand'),
            )
          ],
        ),
      ),
    );
  }
}
