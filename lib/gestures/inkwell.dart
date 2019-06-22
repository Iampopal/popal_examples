import 'package:flutter/material.dart';

class InkWellApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'InkWell';
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
      body: Center(
        child: MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final snackBar = SnackBar(
          content: Text('Tap'),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text('Ripple Button'),
      ),
    );
  }
}
