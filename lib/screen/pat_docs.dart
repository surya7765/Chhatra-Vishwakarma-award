import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import './display_records.dart';

class PatDocs extends StatefulWidget {
  @override
  _PatDocsState createState() => _PatDocsState();
}

class _PatDocsState extends State<PatDocs> {
  String _imageUrl;
  File _imageFile;
  Future<void> _showSelectionDialog(BuildContext context) {
    Future getCamera() async {
      final pickedFile =
          await ImagePicker.pickImage(source: ImageSource.camera);

      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }

    Future getGallery() async {
      final pickedFile =
          await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        getGallery();
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        getCamera();
                      },
                    )
                  ],
                ),
              ));
        });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(_imageFile.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    // taskSnapshot.ref.getDownloadURL().then(
    //       (value) => print("Done: $value"),
    //     );
    taskSnapshot.ref.getDownloadURL().then((fileURL) {
      setState(() {
        _imageUrl = fileURL;
      });
    });
  }

  Widget _setImageView() {
    if (_imageFile != null) {
      return Image.file(_imageFile, width: 500, height: 500);
    } else {
      return Text("No Records Available");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[700],
        appBar: AppBar(
          backgroundColor: Colors.brown[100],
          title: Text(
            "Patient's Documents",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_outlined),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.archive),
              tooltip: "Show Records",
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => DisplayRecords()));
              },
            ), //IconButton
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[_setImageView()],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                uploadImageToFirebase(context);
              },
              child: Icon(Icons.file_upload),
            ),
            SizedBox(
              width: 10.0,
            ),
            FloatingActionButton(
              onPressed: () {
                _showSelectionDialog(context);
              },
              child: Icon(Icons.camera_alt),
            ),
          ],
        ));
  }
}
