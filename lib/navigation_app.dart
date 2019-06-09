import 'package:flutter/material.dart';

class NavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation",
      home: FirstRoute(),
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I am First route"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Goto Second Route"),
          onPressed: () {
            //todo: goto Second Route
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondRoute()));
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I am Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Goto First Route"),
          onPressed: () {
            //todo goto Second Route
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
