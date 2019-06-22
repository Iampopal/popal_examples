import 'package:flutter/material.dart';

class GestureDetuctorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'GuestureDetuctor Tap';
    return MaterialApp(
      title: title,
      home: AppHome(title: title),
    );
  }
}

class AppHome extends StatelessWidget {
  final String title;
  const AppHome({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: MyButton()),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context, 'Tap'),
      onDoubleTap: () => onTap(context, 'Double Tap'),
      onLongPress: () => onTap(context, 'Long Press'),
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.circular(8.0)),
        child: Text('Guesture Button'),
      ),
    );
  }
}

onTap(BuildContext context, String msg) {
  Scaffold.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: Duration(seconds: 1)));
}
