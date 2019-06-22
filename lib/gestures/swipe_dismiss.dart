import 'package:flutter/material.dart';

class SwipableApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String title = 'Swipe Dismiss';
    return MaterialApp(
      title: title,
      home: AppHome(title: title),
    );
  }
}

class AppHome extends StatefulWidget {
  final String title;
  AppHome({Key key, this.title}) : super(key: key);
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  final items = List<String>.generate(12, (i) => 'Item ' + (i + 1).toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          final item = items[i];

          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(i);
              });

              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Dismiss: $item')));
            },
            background: Container(
              color: Colors.red,
            ),
            child: ListTile(
              title: Text('$item'),
            ),
          );
        },
      ),
    );
  }
}
