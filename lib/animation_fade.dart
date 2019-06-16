import 'package:flutter/material.dart';

class AnimationFade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animation Test",
      home: FadeAppPage(title: "Fade App Home"),
    );
  }
}

class FadeAppPage extends StatefulWidget {
  FadeAppPage({Key key, this.title}) : super(key: key);
  final String title;

  _FadeAppPageState createState() => _FadeAppPageState();
}

class _FadeAppPageState extends State<FadeAppPage>
    with TickerProviderStateMixin {
  AnimationController animationController;
  CurvedAnimation curvedAnimation;
  bool isShow = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);

    curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: curvedAnimation,
            child: isShow
                ? FlutterLogo(
                    size: 100.0,
                  )
                : Icon(
                    Icons.star,
                    size: 100.0,
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "i Fade",
        child: Icon(Icons.brush),
        onPressed: () {
          setState(() {
            isShow = !isShow;
            animationController.forward();
          });
        },
      ),
    );
  }
}
