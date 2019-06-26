import 'package:flutter/material.dart';

class LongListApp extends StatelessWidget {
  final items = List<String>.generate(10000, (i) => "Name ${i + 1}");

  @override
  Widget build(BuildContext context) {
    final appTitle = "Long List";
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (countext, i) {
            return ListTile(
              title: Text(items[i]),
            );
          },
        ),
      ),
    );
  }
}
