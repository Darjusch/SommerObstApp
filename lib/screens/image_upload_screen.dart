import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sommerobst_app_beta/widgets/custom_app_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class ImageUploadScreen extends StatefulWidget {
  final String standName;
  ImageUploadScreen({@required this.standName});

  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState(standName: this.standName);
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  final String standName;

  _ImageUploadScreenState({@required this.standName});


  var imageDescriptionController = TextEditingController();

  String currentDate = DateFormat('yMEd').format(DateTime.now());
  File _pickedImage;

  Future<void> pickImage() async {
    print('picked');
    try {
      final picker = ImagePicker();
      final pickedImage = await picker.getImage(source: ImageSource.camera);
      final pickedImageFile = File(pickedImage.path);
      setState(() {
        _pickedImage = pickedImageFile;
      });
    } catch (err) {
      print(err);
    }
  }

  void uploadImage() {
    print('upload');
    try {
      if (_pickedImage != null) {
        currentDate = currentDate.replaceAll('/', '.');
        String imageUrl = 'Stände/' + standName + '/' + currentDate + imageDescriptionController.text + '.jpg';
        var ref = FirebaseStorage.instance
            .ref()
            .child('Stände/' + standName + '/' + currentDate)
            .child(imageDescriptionController.text + '.jpg');
        ref.putFile(_pickedImage);
        print('uploaded');
        saveImageUrl(imageUrl, imageDescriptionController.text);
      }
    } catch (err) {
      print(err);
    }
  }

  void saveImageUrl(imageUrl, description) async {
    await Firestore.instance
        .collection('Stände')
        .document('Testing')
        .collection(currentDate)
        .document(standName)
        .collection('images').document().setData({
      'imageUrl': imageUrl,
      'description': description
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            children: <Widget>[
              Spacer(),
              RaisedButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(120)),
                onPressed: () => {
                  pickImage(),
                },
                label: Text('Camera'),
                icon: Icon(Icons.camera),
              ),
              Spacer(),
              if(_pickedImage != null)
              TextField(
                decoration:
                    InputDecoration(hintText: 'A description is required'),
                controller: imageDescriptionController,
              ),
              Spacer(),
              if(_pickedImage != null)
              FlatButton(
                onPressed: () => {
                  uploadImage(),
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(120)),
                child: Text('Upload'),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}