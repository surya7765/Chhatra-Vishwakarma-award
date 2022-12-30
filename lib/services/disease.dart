import 'package:flutter/material.dart';
import 'package:vishwakarma/screen/Cancer.dart';
import 'package:vishwakarma/screen/Kidney.dart';
import 'package:vishwakarma/screen/Liver.dart';
import 'package:vishwakarma/screen/Maleria.dart';
import 'package:vishwakarma/screen/diabetes.dart';
import 'package:vishwakarma/screen/heart.dart';
import 'package:vishwakarma/screen/notification.dart';
import 'package:vishwakarma/screen/pnemonia.dart';

class Diseases extends StatefulWidget {
  @override
  _DiseasesState createState() => _DiseasesState();
}

class _DiseasesState extends State<Diseases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Health Care App",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromRGBO(243, 207, 207, 2),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Notifications()));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text("Cancer"),
              color: Colors.teal[100],
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => Cancer())),
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Maleria'),
              color: Colors.teal[200],
            ),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Maleria())),
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Kidney'),
              color: Colors.teal[600],
            ),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Pnemonia())),
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Diabetes'),
              color: Colors.teal[300],
            ),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Diabetes())),
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Heart'),
              color: Colors.teal[400],
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => Heart())),
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Lever'),
              color: Colors.teal[500],
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => Liver())),
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Kidney'),
              color: Colors.teal[600],
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => Kidney())),
          ),
        ],
      ),
    );
  }
}
