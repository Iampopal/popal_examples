import 'package:flutter/material.dart';

void main() => runApp(LayoutApp());

class LayoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Layouts Layout",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(
        title: "Layouts Layout Demo",
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  MyHome({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(
            "images/lake.jpg",
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          bottomSection,
          textSection,
        ],
      ),
    );
  }

  final Widget titleSection = Container(
    padding: EdgeInsets.all(32),
    child: Row(
      children: <Widget>[
        //! 1
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  "My Tour Lake",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "This pic would me my next cover pic",
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              )
            ],
          ),
        ),

        //! 2
        Icon(Icons.star, color: Colors.red[500]),

        //! 3
        Text("41")
      ],
    ),
  );

  // Bottom Column
  static Column _buildBottomColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )
      ],
    );
  }

  static Color _color = Colors.blue;
  final Widget bottomSection = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildBottomColumn(_color, Icons.call, "CALL"),
        _buildBottomColumn(_color, Icons.near_me, "ROUTE"),
        _buildBottomColumn(_color, Icons.share, "SHARE")
      ],
    ),
  );

  final Widget textSection = Container(
    padding: EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );
}
