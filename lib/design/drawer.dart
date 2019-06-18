import 'package:flutter/material.dart';

class MyDrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String appTitle = "Drawer";
    return MaterialApp(
      title: appTitle,
      home: new MyHome(appTitle: appTitle),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({
    Key key,
    @required this.appTitle,
  }) : super(key: key);

  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Center(
        child: Text("Home Body"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // DrawerHeader(
            //   child: Container(
            //     margin: EdgeInsets.only(left: 20),
            //     alignment: Alignment.topLeft,
            //     child: Image.asset(
            //       "images/me.jpg",
            //       width: 60,
            //       height: 60,
            //     ),
            //   ),
            //   decoration: BoxDecoration(color: Colors.blue),
            // ),
            Container(
              color: Colors.blue,
              child: Container(
                margin: EdgeInsets.only(top: 30, left: 10, bottom: 10),
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "images/me.jpg",
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            ListTile(
              title: Text("Item 1"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Item 2"),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
