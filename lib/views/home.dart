import 'package:flutter/material.dart';
import 'package:vishwakarma/screen/healthrecord.dart';
import 'package:vishwakarma/screen/insurance.dart';
import 'package:vishwakarma/screen/notification.dart';
import 'package:vishwakarma/services/chatbot.dart';
import 'package:vishwakarma/services/disease.dart';
import 'package:vishwakarma/services/gmaps.dart';
import 'package:vishwakarma/services/products.dart';
import 'package:vishwakarma/views/slidder.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
      drawer: Container(
        color: Color.fromRGBO(243, 207, 207, 2),
        child: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp0xKoXUryp0JZ1Sxp-99eQiQcFrmA1M1qbQ&usqp=CAU'),
                ),
                accountName: Text(
                  "Vishawkarma",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black87,
                  ),
                ),
                accountEmail: Text(
                  "Vishawkarma@gmail.com",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              ListTile(
                title: Text("Emergency HelpLine"),
                leading: Icon(Icons.person_search_outlined),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Diseases())),
              ),
              ListTile(
                title: Text("Doctor Consultant"),
                leading: Icon(Icons.access_alarm),
                onTap: () {},
              ),
              ListTile(
                title: Text("Health Record"),
                leading: Icon(Icons.accessibility),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HealthRecordPage())),
              ),
              ListTile(
                title: Text("Ask Doctor"),
                leading: Icon(
                  Icons.post_add_rounded,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ChatBot())),
              ),
              ListTile(
                title: Text("Diagnostic Centre"),
                leading: Icon(Icons.help_outline_rounded),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Gmaps())),
              ),
              ListTile(
                title: Text("Appointment"),
                leading: Icon(Icons.help_outline_rounded),
                onTap: () {},
              ),
              ListTile(
                title: Text("Insurance"),
                leading: Icon(Icons.help_outline_rounded),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Insurance())),
              ),
              Expanded(
                child: Divider(
                  color: Colors.black,
                ),
              ),
              ListTile(
                title: Text("Contact Us"),
                leading: Icon(Icons.help_outline_rounded),
                onTap: () {},
              ),
              ListTile(
                title: Text("Privacy Policy"),
                leading: Icon(Icons.help_outline_rounded),
                onTap: () {},
              ),
            ],
          ),
        ),
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
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => BuyProducts())),
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
      body: Container(
        color: Colors.green[300],
        child: TabBarView(
          controller: tabController,
          children: <Widget>[
            Slidder(),
            Text("Hello"),
            Text("World"),
            Text("Help"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.chat_bubble,
        ),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => ChatBot())),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
