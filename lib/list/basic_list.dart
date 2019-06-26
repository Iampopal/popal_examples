import 'package:flutter/material.dart';

class BasicListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Basic List';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text("Map"),
            ),
            ListTile(
              title: Text('Album'),
              leading: Icon(Icons.album),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
