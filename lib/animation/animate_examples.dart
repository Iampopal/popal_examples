import 'package:flutter/material.dart';

//!Animation 1
class Animation1 extends StatefulWidget {
  Animation1({Key key}) : super(key: key);
  _Animation1State createState() => _Animation1State();
}

class _Animation1State extends State<Animation1>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: GestureDetector(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: animation.value,
            height: animation.value,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

//!Animation 2
// #docregion AnimatedLogo
class AnimatedLogo2 extends AnimatedWidget {
  AnimatedLogo2({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: animation.value,
        height: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

// #decoregin AnimatedLogo
class Animation2 extends StatefulWidget {
  Animation2({Key key}) : super(key: key);
  _Animation2State createState() => _Animation2State();
}

class _Animation2State extends State<Animation2>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedLogo2(animation: animation);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

//!Animation 3
class Animation3 extends StatefulWidget {
  Animation3({Key key}) : super(key: key);
  _Animation3State createState() => _Animation3State();
}

class _Animation3State extends State<Animation3>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    opacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController)
          ..addListener(() {
            setState(() {});
          });

    animation = Tween<double>(begin: 50, end: 300).animate(animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
        print("$status");
      });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: opacityAnimation.value,
        child: Container(
          color: Colors.purple,
          child: Center(
            child: Container(
              width: animation.value,
              height: animation.value,
              child: FlutterLogo(),
            ),
          ),
        ),
      ),
    );
  }
}

//! Animation 4
class LogoWidget4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Container(
                color: Colors.grey,
                width: animation.value,
                height: animation.value,
                child: child,
              ),
          child: child,
        ),
      );
}

class Animation4 extends StatefulWidget {
  Animation4({Key key}) : super(key: key);

  _Animation4State createState() => _Animation4State();
}

class _Animation4State extends State<Animation4>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(animationController);

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) =>
      GrowTransition(animation: animation, child: LogoWidget4());

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
