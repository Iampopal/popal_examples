import 'package:flutter/material.dart';

const heroTag = 'imgHero';

class HeroAnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Main Screen Hero Animation';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: Text(appTitle)),
        body: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return DetailScreen();
            }));
          },
          child: Center(
            child: Hero(
              tag: heroTag,
              child: Image.asset(
                'images/me.jpg',
                width: 200,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: heroTag,
            child: Image.asset(
              'images/me.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
