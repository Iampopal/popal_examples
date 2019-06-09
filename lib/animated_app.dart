import 'package:flutter/material.dart';

class MyAnimatedContainerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String appTitle = "Opacity Animation";
    return MaterialApp(
      title: appTitle,
      home: MyHome(
        title: appTitle,
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key key, this.title}) : super(key: key);
  final String title;
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isVisible = !_isVisible;
          });
        },
        tooltip: "Toggle Opacity",
        child: Icon(Icons.flip),
      ),
    );
  }
}
