import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NetworkImageApp extends StatelessWidget {
  const NetworkImageApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Network Image';
    return MaterialApp(
      title: appTitle,
      home: AppHome(title: appTitle),
    );
  }
}

class AppHome extends StatelessWidget {
  final title;
  AppHome({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            //! Catch Image
            ImageTitle(title: 'Catch Image'),
            CachedNetworkImage(
              placeholder: (context, url) => CircularProgressIndicator(),
              imageUrl: 'https://picsum.photos/250?image=9',
            ),

            //! Fade in Image (Only Work in first Time loading the image)
            ImageTitle(title: 'Fade in Image'),
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://picsum.photos/250?image=9',
              width: 300,
              height: 300,
            ),

            //! GIF
            ImageTitle(title: 'GIF Image'),
            Image.network(
              'https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true',
            ),

            //! Simple Image
            ImageTitle(title: 'Network Image'),
            Image.network(
              "https://picsum.photos/250?image=9",
            ),
          ],
        ),
      ),
    );
  }
}

class ImageTitle extends StatelessWidget {
  final title;
  const ImageTitle({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 18),
        color: Colors.blue[100],
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
