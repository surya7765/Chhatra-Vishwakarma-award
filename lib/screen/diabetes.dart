import 'package:flutter/material.dart';
import 'package:vishwakarma/screen/notification.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Diabetes extends StatefulWidget {
  @override
  _DiabetesState createState() => _DiabetesState();
}

class _DiabetesState extends State<Diabetes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Diabetes",
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
      body: WebView(
        initialUrl: "https://myml-mtapp.herokuapp.com/diabetes",
      ),
    );
  }
}
