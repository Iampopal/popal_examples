import 'package:flutter/material.dart';
import 'package:popal_examples/animated_app.dart';
import 'package:popal_examples/animated_container.dart';
import 'package:popal_examples/drawer.dart';
import 'package:popal_examples/drawing.dart';
import 'package:popal_examples/form_app.dart';
import 'package:popal_examples/friendly_chat.dart';
import 'package:popal_examples/hero1.dart';
import 'package:popal_examples/navigation_app.dart';
import 'package:popal_examples/package_font.dart';
import 'package:popal_examples/snackbar.dart';
import 'package:popal_examples/toggle_widget.dart';
import 'package:popal_examples/ui_orientation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popal Examples',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Popal Examples'),
        ),
        body: AppBody(),
      ),
    );
  }
}

//Button That Route user to other page
class RouteButton extends StatelessWidget {
  RouteButton({this.text, this.widget});
  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        var route = MaterialPageRoute(builder: (context) => widget);
        Navigator.push(context, route);
      },
      child: Text(text),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //! Simple Form With Validation
        RouteButton(
          text: "Simple Form with Validation",
          widget: FormDemo(appTitle: "Simple Form with Validation"),
        ),

        //! Navigator Raouter
        RouteButton(text: 'Navigator Raouter', widget: NavigationApp()),

        //! Friendly Chat
        RouteButton(text: 'Friendly chat', widget: FriendlyChat()),

        //! Add Remove Widget
        RouteButton(text: 'Add remove widget', widget: ToggleWidget()),

        //! Drawing Fade
        RouteButton(text: 'Drawing Fade', widget: BasicDrawing()),

        //! Animated Container
        RouteButton(text: 'Animated Container', widget: AnimatedContainerApp()),

        //! My Animated Container
        RouteButton(text: 'Opacity Animation', widget: OpacityAnimationApp()),

        //!Hero 1
        RouteButton(text: 'Hero 1', widget: Hero1()),

        //! My Drawer App
        RouteButton(text: 'My Drawer App', widget: MyDrawerApp()),

        //! My Snack bar App
        RouteButton(text: 'SnackBar', widget: SnackbarDemo()),

        //! Font Asset
        RouteButton(text: 'Font Assets', widget: PackageFontApp()),

        //! Ui Oientation
        RouteButton(text: 'Ui Orientation', widget: UiOrientationApp()),
      ],
    );
  }
}
