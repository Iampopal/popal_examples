import 'package:flutter/material.dart';

class ThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Custom Theme",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.yellow[900],
        accentColor: Colors.yellow[600],

        fontFamily: 'Raleway',

        //Text Theme
        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 31.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 18.0, fontFamily: 'Abel'),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Theme'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8),
          color: Theme.of(context).accentColor,
          child: Text(
            "Title Text",
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
