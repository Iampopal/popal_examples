import 'package:flutter/material.dart';

class SnackbarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = "Snack Bar";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: SnackBarAppHome(title: title),
    );
  }
}

class SnackBarAppHome extends StatelessWidget {
  SnackBarAppHome({this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SnackbarBody(),
    );
  }
}

class SnackbarBody extends StatelessWidget {
  const SnackbarBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("Show Snackbar"),
        onPressed: () {
          _showSnackBar(context);
        },
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    final snackbar = SnackBar(
      content: Text('Hay! A Snackbar!'),
      action: SnackBarAction(
        label: 'Undo',
        textColor: Colors.black,
        onPressed: () {
          print("You want to undo");
        },
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red[900],
    );

    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
