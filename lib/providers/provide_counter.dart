import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//! 1. Model
class Count extends ChangeNotifier {
  int value = 0;

  void increment() {
    value++;
    notifyListeners();
  }

  void decrement() {
    value--;
    notifyListeners();
  }
}

class ProviderCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => Count(),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String appTitle = 'Provider Counter';
    return MaterialApp(
      title: appTitle,
      home: AppHomePage(
        appTitle: appTitle,
      ),
    );
  }
}

class AppHomePage extends StatelessWidget {
  final appTitle;
  AppHomePage({this.appTitle});
  final double buttonHeight = 120;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //* display Count
              Consumer<Count>(builder: (context, count, child) {
                return Container(
                  margin: EdgeInsets.all(12),
                  child: Text(
                    '${count.value}',
                    style: Theme.of(context).textTheme.display3,
                  ),
                );
              }),

              Container(
                height: buttonHeight,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      //* Increment Button
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: RaisedButton(
                            child: Text(
                              '+',
                              style: Theme.of(context).textTheme.display2,
                            ),
                            onPressed: () {
                              Provider.of<Count>(context, listen: false)
                                  .increment();
                            },
                          ),
                        ),
                      ),
                      //* Decrement Button
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: RaisedButton(
                            child: Text(
                              '-',
                              style: Theme.of(context).textTheme.display2,
                            ),
                            onPressed: () {
                              Provider.of<Count>(context, listen: false)
                                  .decrement();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
