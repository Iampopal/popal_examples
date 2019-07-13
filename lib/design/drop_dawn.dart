import 'package:flutter/material.dart';

class DropDawnApp extends StatefulWidget {
  @override
  _DropDawnAppState createState() => _DropDawnAppState();
}

class PopItem {
  final String name;
  final MaterialColor color;

  const PopItem({this.name, this.color});
}

const List<PopItem> popItems = const <PopItem>[
  const PopItem(color: Colors.blue, name: "Blue"),
  const PopItem(color: Colors.red, name: "Red"),
  const PopItem(color: Colors.yellow, name: "Yellow"),
  const PopItem(color: Colors.purple, name: "purpule"),
];

class _DropDawnAppState extends State<DropDawnApp> {
  var selectedValue = "Select Dropdawn";
     var primaryColor = Colors.blue;
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: primaryColor),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Drop Dawn"),
          actions: <Widget>[
            PopupMenuButton<PopItem>(
              onSelected: (popItem) {
                setState(() {
                  primaryColor = popItem.color;
                });
              },
              itemBuilder: (BuildContext context) {
                return popItems.map((PopItem popItem) {
                  return PopupMenuItem<PopItem>(
                    value: popItem,
                    child: Text(popItem.name),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: Center(
          child: DropdownButton<String>(
            hint: Text(selectedValue),
            items: <String>['Choice A', 'Choice B', 'Choice C']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedValue = newValue;
              });
            },
          ),
        ),
      ),
    );
  }
}
