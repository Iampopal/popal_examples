import 'package:flutter/material.dart';

class Hero1 extends StatelessWidget {
  const Hero1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hero",
      home: HeroAnimation1(),
    );
  }
}

class HeroAnimation1 extends StatelessWidget {
  const HeroAnimation1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body: Center(
        child: PhotoHero(
          photo: 'images/me.jpg',
          width: 300,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => FlippperPage2(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FlippperPage2 extends StatelessWidget {
  const FlippperPage2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flipper Page"),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.all(16),
        alignment: Alignment.topLeft,
        child: PhotoHero(
          photo: 'images/me.jpg',
          width: 100,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);
  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
