import 'package:flutter/material.dart';

class ToggleWidget extends StatelessWidget {
  const ToggleWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Toggle Widget Example",
      home: SimpleAppPage(),
    );
  }
}

class SimpleAppPage extends StatefulWidget {
  SimpleAppPage({Key key}) : super(key: key);

  _SimpleWidgetState createState() => _SimpleWidgetState();
}

class _SimpleWidgetState extends State<SimpleAppPage> {
  bool toggle = true;
  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return RaisedButton(
        onPressed: () {},
        child: Text("Toggle One"),
      );
    } else {
      return MaterialButton(
        onPressed: () {},
        child: Text("Toggle Two"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Widget"),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: "Update Text",
        child: Icon(Icons.update),
      ),
    );
  }
}
