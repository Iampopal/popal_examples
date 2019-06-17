import 'package:flutter/material.dart';

class TabsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tabs App",
      home: AppHome(),
    );
  }
}

class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Tabs Demo'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          )),
    );
  }
}
