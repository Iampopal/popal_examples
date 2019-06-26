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
          child: Hero(
            tag: heroTag,
            child: Image.network(
              'https://picsum.photos/250?image=9',
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
            child: Image.network(
              'https://picsum.photos/250?image=9',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
