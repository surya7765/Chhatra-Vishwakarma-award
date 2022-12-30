import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayRecords extends StatefulWidget {
  @override
  _DisplayRecordsState createState() => _DisplayRecordsState();
}

class _DisplayRecordsState extends State<DisplayRecords> {
  final FirebaseFirestore fb = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Records'),
      ),
      body: FutureBuilder(
        future: getImages(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    title: Text(
                      snapshot.data.docs[index].data()["uploads/name"],
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    leading: Image.network(
                        snapshot.data.docs[index].data()["name"],
                        fit: BoxFit.fill),
                  );
                });
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Text("No data");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<QuerySnapshot> getImages() {
    return fb.collection("images").get();
  }
}
