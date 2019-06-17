import 'package:flutter/material.dart';

class UiOrientationApp extends StatelessWidget {
  final String appTitle = 'Ui Orientation';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: OrientationHome(
        appTitle: appTitle,
      ),
    );
  }
}

class OrientationHome extends StatelessWidget {
  final String appTitle;
  OrientationHome({Key key, this.appTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
              children: List.generate(100, (indext) {
                return MaterialButton(
                  padding: EdgeInsets.zero,
                  child: Container(
                    margin: EdgeInsets.all(2),
                    color: (0 == (indext % 2)) ? Colors.red : Colors.grey,
                    padding: EdgeInsets.all(12),
                    child:
                        Center(child: Text("Item " + (indext + 1).toString())),
                  ),
                  onPressed: () {
                    final SnackBar snackBar = SnackBar(
                      content:
                          Text("You Click item " + (indext + 1).toString()),
                      action: SnackBarAction(
                        label: 'Cancel',
                        onPressed: () {},
                      ),
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                );
              }),
            );
          },
        ));
  }
}
