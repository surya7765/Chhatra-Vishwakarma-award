import 'package:flutter/material.dart';
import 'package:vishwakarma/screen/doc_docs.dart';
import 'package:vishwakarma/screen/kidney_docs.dart';
import 'package:vishwakarma/screen/mri_docs.dart';
import 'package:vishwakarma/screen/pat_docs.dart';

class HealthRecordPage extends StatefulWidget {
  @override
  _HealthRecordPageState createState() => _HealthRecordPageState();
}

class _HealthRecordPageState extends State<HealthRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(243, 207, 207, 2),
        title: Text(
          'HEALTH RECORD',
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
            icon: Icon(Icons.notifications),
            color: Colors.black,
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: Icon(Icons.search_outlined),
            color: Colors.black,
            onPressed: () {},
          ), //IconButton
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => mriDocs()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              height: 100.0,
              width: double.infinity,
              color: Colors.transparent,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: new Center(
                    child: new Text(
                      "MRI Scan Documents",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => KidneyDocs()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              height: 100.0,
              width: double.infinity,
              color: Colors.transparent,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: new Center(
                    child: new Text(
                      "Kidney Documents",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DocDocs()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              height: 100.0,
              width: double.infinity,
              color: Colors.transparent,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: new Center(
                    child: new Text(
                      "Doctor's  Documents",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PatDocs()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              height: 100.0,
              width: double.infinity,
              color: Colors.transparent,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: new Center(
                    child: new Text(
                      "Patient's Document",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown[100],
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.video_collection),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.ac_unit),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        foregroundColor: Colors.green[900],
        child: Icon(Icons.favorite),
        backgroundColor: Colors.black,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
