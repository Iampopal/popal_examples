import 'package:flutter/material.dart';

class GridListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Grid List';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: GridView.count(
            crossAxisCount: 2,
            children: List.generate(100, (indext) {
              return Center(
                child: Text(
                  'Item $indext',
                  style: Theme.of(context).textTheme.headline,
                ),
              );
            })),
      ),
    );
  }
}
