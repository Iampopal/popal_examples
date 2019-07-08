import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueApp extends StatefulWidget {
  @override
  _KeyValueAppState createState() => _KeyValueAppState();
}

class _KeyValueAppState extends State<KeyValueApp> {
  var _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _incrementcounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt("counter") ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Key Value"),
        ),
        body: Center(
          child: Text("$_counter", style: Theme.of(context).textTheme.display1),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _incrementcounter();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
