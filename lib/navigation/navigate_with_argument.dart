import 'package:flutter/material.dart';

class NavigateWithArgumentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Navigate With Argument';
    return MaterialApp(
      title: appTitle,
      home: HomeScreen(appTitle),
      routes: {
        ExtractArgumentScreen.routeName: (context) => ExtractArgumentScreen(),
      },
      onGenerateRoute: (setting) {
        if (setting.name == PassArgumentScreen.routeName) {
          final ScreenArgument args = setting.arguments;
          return MaterialPageRoute(builder: (context) {
            PassArgumentScreen(
              message: args.message,
              name: args.message,
            );
          });
        }
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final title;
  HomeScreen(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title + " Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Navigate to screen that extracts arguments"),
              onPressed: () {
                Navigator.pushNamed(context, ExtractArgumentScreen.routeName,
                    arguments: ScreenArgument(
                        name: "This is a name: Popal",
                        message: "This is message: Hello world"));
              },
            ),
            RaisedButton(
              child: Text("Navigate to a named that accepts arguments"),
              onPressed: () {
                Navigator.pushNamed(context, ExtractArgumentScreen.routeName,
                    arguments: ScreenArgument(
                        name: "This is a name: Popal",
                        message: "This is message: Hello world"));
              },
            ),
          ],
        ),
      ),
    );
  }
}

//Extract Screen
class ExtractArgumentScreen extends StatelessWidget {
  static const routeName = '/extractArgument';

  @override
  Widget build(BuildContext context) {
    final ScreenArgument args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name),
      ),
      body: Center(child: Text(args.message)),
    );
  }
}

/// A Widget that accepts the necessary arguments via the constructor.
class PassArgumentScreen extends StatelessWidget {
  static const routeName = '/routeName';
  final name;
  final message;
  PassArgumentScreen({Key key, @required this.name, @required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name: " + name),
      ),
      body: Center(
        child: Text("Message: " + message),
      ),
    );
  }
}

///Argument Model
class ScreenArgument {
  final String name;
  final String message;
  ScreenArgument({this.name, this.message});
}
