import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerApp extends StatefulWidget {
  AnimatedContainerApp({Key key}) : super(key: key);

  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 50;
  double _height = 50;
  double _radius = 8;
  Color _color = Colors.green;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Animated Container App"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Flexible(
                child: Container(
                  child: Center(
                    child: AnimatedContainer(
                      width: _width,
                      height: _height,
                      decoration: BoxDecoration(
                        color: _color,
                        borderRadius: BorderRadius.circular(_radius),
                      ),
                      duration: Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                ),
              ),
              Divider(height: 1),
              Container(
                padding: EdgeInsets.only(top: 6, bottom: 4),
                color: Colors.grey[200],
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "W: $_width\nH: $_height\nR: $_radius\nColor: " +
                              _color.value.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue[900],
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            setState(() {
              final random = Random();

              //!generate random
              _width = random.nextInt(300).toDouble();
              _height = random.nextInt(300).toDouble();

              _color = Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                1,
              );

              _radius = random.nextInt(100).toDouble();
            });
          },
        ),
      ),
    );
  }
}
