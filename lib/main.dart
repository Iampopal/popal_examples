import 'package:flutter/material.dart';
import 'package:popal_examples/animation/hero1.dart';
import 'package:popal_examples/design/drawer.dart';
import 'package:popal_examples/design/fonts.dart';
import 'package:popal_examples/design/snackbar.dart';
import 'package:popal_examples/design/tabs.dart';
import 'package:popal_examples/design/themes.dart';
import 'package:popal_examples/design/ui_orientation.dart';
import 'package:popal_examples/examples/drawing.dart';
import 'package:popal_examples/examples/friendly_chat.dart';
import 'package:popal_examples/examples/layout.dart';
import 'package:popal_examples/examples/toggle_widget.dart';
import 'package:popal_examples/forms/form_app.dart';
import 'package:popal_examples/navigation/navigation_app.dart';
import 'package:popal_examples/providers/provide_counter.dart';
import 'package:popal_examples/providers/shopper_provider/shopper_main.dart';
import 'animation/animated_app.dart';
import 'animation/animated_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Popal Examples',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Popal Examples'),
        ),
        body: AppBody(),
      ),
    );
  }
}

int exampleNo = 0;

class ExampleButton extends StatefulWidget {
  const ExampleButton({
    Key key,
    @required this.text,
    @required this.widget,
  }) : super(key: key);

  final String text;
  final Widget widget;

  @override
  _ExampleButtonState createState() {
    exampleNo++;
    return _ExampleButtonState();
  }
}

class _ExampleButtonState extends State<ExampleButton> {
  final currentExampleNo = exampleNo;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      child: Material(
        color: Colors.yellow[700],
        child: InkWell(
          onTap: () {
            var route = MaterialPageRoute(builder: (context) => widget.widget);
            Navigator.push(context, route);
          },
          child: Row(
            children: <Widget>[
              Container(
                height: double.maxFinite,
                width: 40,
                child: Center(
                  child: Text(
                    "$currentExampleNo",
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
              ),
              Flexible(
                child: Text(widget.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.height / 200,
      children: <Widget>[
        //! Simple Form With Validation
        ExampleButton(
          text: "Layout",
          widget: LayoutApp(),
        ),

        //! Simple Form With Validation
        ExampleButton(
          text: "Simple Form ",
          widget: FormDemo(appTitle: "Simple Form"),
        ),

        //! Navigator Raouter
        ExampleButton(text: 'Route Screen', widget: NavigationApp()),

        //! Friendly Chat
        ExampleButton(text: 'Friendly chat', widget: FriendlyChat()),

        //! Add Remove Widget
        ExampleButton(text: 'Add remove widget', widget: ToggleWidget()),

        //! Drawing Fade
        ExampleButton(text: 'Drawing Fade', widget: BasicDrawing()),

        //! Animated Container
        ExampleButton(
            text: 'Animated Container', widget: AnimatedContainerApp()),

        //! My Animated Container
        ExampleButton(text: 'Opacity Animation', widget: OpacityAnimationApp()),

        //!Hero 1
        ExampleButton(text: 'Hero 1', widget: Hero1()),

        //! My Drawer App
        ExampleButton(text: 'My Drawer App', widget: MyDrawerApp()),

        //! My Snack bar App
        ExampleButton(text: 'SnackBar', widget: SnackbarDemo()),

        //! Font Asset
        ExampleButton(text: 'Font Assets', widget: FontApp()),

        //! Ui Oientation
        ExampleButton(text: 'Ui Orientation', widget: UiOrientationApp()),

        //! Custom Theme
        ExampleButton(text: 'Custom Theme', widget: ThemeApp()),

        //! Tab Example
        ExampleButton(text: 'Tab App', widget: TabsApp()),

        //! Counter Provier
        ExampleButton(text: 'Counter Provider', widget: ProviderCounterApp()),

        //! Counter Provier
        ExampleButton(
            text: 'My Shopper Provider', widget: MyShopperProviderApp()),
      ],
    );
  }
}
