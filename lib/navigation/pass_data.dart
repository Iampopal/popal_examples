import 'package:flutter/material.dart';

class ToDo {
  final String name, description;
  ToDo(this.name, this.description);
}

class PassDataApp extends StatelessWidget {
  final appTitle = 'Pass Data to Other Screen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: HomeScreen(title: appTitle),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String title;
  HomeScreen({Key key, this.title}) : super(key: key);
  final todos = List<ToDo>.generate(
    20,
    (i) => ToDo(
        "Todo ${i + 1}", "A description for what to be done for ToDo ${i + 1}"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(todos[i].name),
            // subtitle: Text(todos[i].description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                        toDo: todos[i],
                      ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final ToDo toDo;
  DetailsScreen({Key key, this.toDo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(toDo.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(toDo.description),
      ),
    );
  }
}
