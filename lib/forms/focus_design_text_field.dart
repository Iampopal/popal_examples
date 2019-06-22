import 'package:flutter/material.dart';

class FocusDesginTextFieldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Focus Text Field';
    return MaterialApp(
      title: appTitle,
      home: AppHome(title: appTitle),
    );
  }
}

class AppHome extends StatefulWidget {
  final String title;
  AppHome({Key key, this.title}) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'First Text Field with no border',
                    border: InputBorder.none),
              ),
              TextField(
                autofocus: true,
                focusNode: myFocusNode,
                decoration: InputDecoration(hintText: 'Second Text Field'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Thirdth Text Field'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(myFocusNode);
        },
        tooltip: 'Focus Second Text Field',
        child: Icon(Icons.edit),
      ),
    );
  }
}
