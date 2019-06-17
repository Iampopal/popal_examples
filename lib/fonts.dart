import 'package:flutter/material.dart';

void main() => runApp(FontApp());

class FontApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Package Fonts',
      theme: ThemeData(fontFamily: 'Abel'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The AppBar uses the app-default Raleway font.
      appBar: AppBar(title: Text('Package Fonts')),
      body: Center(
        // This Text widget uses the RobotoMono font.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Default Font\n', style: TextStyle(fontSize: 21.0)),
            Text(
              'Using the Able Font \n',
              style: TextStyle(fontFamily: 'Abel', fontSize: 21.0),
            ),
            Text(
              'Using the Relayway Font \n',
              style: TextStyle(fontFamily: 'Relayway', fontSize: 21.0),
            ),
            Text(
              'One more',
              style: TextStyle(fontSize: 21),
            )
          ],
        ),
      ),
    );
  }
}
