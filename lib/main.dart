import 'package:flutter/material.dart';
import 'package:popal_examples/examples/text_to_speach.dart';
import 'package:popal_examples/examples/tts.dart';
import 'package:popal_examples/navigation/hero1.dart';
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
import 'package:popal_examples/forms/focus_design_text_field.dart';
import 'package:popal_examples/forms/form_app.dart';
import 'package:popal_examples/forms/retrive_text_input.dart';
import 'package:popal_examples/gestures/guestureDetector.dart';
import 'package:popal_examples/gestures/inkwell.dart';
import 'package:popal_examples/gestures/swipe_dismiss.dart';
import 'package:popal_examples/images/network_image.dart';
import 'package:popal_examples/list/basic_list.dart';
import 'package:popal_examples/list/floating_appbar_list.dart';
import 'package:popal_examples/list/grid_list.dart';
import 'package:popal_examples/list/horizontal_list.dart';
import 'package:popal_examples/list/mixed_list.dart';
import 'package:popal_examples/list/long_list.dart';
import 'package:popal_examples/navigation/hero_animation.dart';
import 'package:popal_examples/navigation/navigate_name.dart';
import 'package:popal_examples/navigation/navigate_with_argument.dart';
import 'package:popal_examples/navigation/navigation_app.dart';
import 'package:popal_examples/navigation/pass_data.dart';
import 'package:popal_examples/networking/fetch_data.dart';
import 'package:popal_examples/presistence/baby_names.dart';
import 'package:popal_examples/presistence/key_value.dart';
import 'package:popal_examples/presistence/sqllite_client/sqlite_app.dart';
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
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Center(
                  child: Text(
                    "$currentExampleNo",
                    style: Theme.of(context).textTheme.title,
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
      childAspectRatio: MediaQuery.of(context).size.height / 140,
      children: <Widget>[
        ExampleButton(text: "Layout", widget: LayoutApp()),
        ExampleButton(
            text: "Form With Validation", widget: FormWithValidationApp()),
        ExampleButton(
            text: "Focus+Design Text Field", widget: FocusDesginTextFieldApp()),
        ExampleButton(
            text: "Retrive Text+/Field", widget: RetriveTextFieldApp()),
        ExampleButton(text: 'Friendly chat', widget: FriendlyChat()),
        ExampleButton(text: 'Add remove widget', widget: ToggleWidget()),
        ExampleButton(text: 'Drawing Fade', widget: BasicDrawing()),
        ExampleButton(
            text: 'Animated Container', widget: AnimatedContainerApp()),
        ExampleButton(text: 'Opacity Animation', widget: OpacityAnimationApp()),
        ExampleButton(text: 'My Drawer App', widget: MyDrawerApp()),
        ExampleButton(text: 'SnackBar', widget: SnackbarDemo()),
        ExampleButton(text: 'Font Assets', widget: FontApp()),
        ExampleButton(text: 'Ui Orientation', widget: UiOrientationApp()),
        ExampleButton(text: 'Custom Theme', widget: ThemeApp()),
        ExampleButton(text: 'Tab App', widget: TabsApp()),
        ExampleButton(text: 'Counter Provider', widget: ProviderCounterApp()),
        ExampleButton(
            text: 'My Shopper Provider', widget: MyShopperProviderApp()),
        ExampleButton(text: 'InkWell Tap', widget: InkWellApp()),
        ExampleButton(text: 'Guesture Tap', widget: GestureDetuctorApp()),
        ExampleButton(text: 'Swipable Dismiss', widget: SwipableApp()),
        ExampleButton(text: 'Image Network', widget: NetworkImageApp()),
        ExampleButton(text: 'Grid List', widget: GridListApp()),
        ExampleButton(text: 'Horizontal List', widget: HorizontalListApp()),
        ExampleButton(text: 'Mixed List', widget: MixedListApp()),
        ExampleButton(
            text: 'Floating Appbar List', widget: FloatingAppbarListApp()),
        ExampleButton(text: 'Basic List', widget: BasicListApp()),
        ExampleButton(text: 'Long List', widget: LongListApp()),
        ExampleButton(text: 'Hero Animation', widget: HeroAnimationApp()),
        ExampleButton(text: 'Hero 1', widget: Hero1()),
        ExampleButton(text: 'Navigatie and back', widget: NavigationBackApp()),
        ExampleButton(
            text: "Navigate to Named Route", widget: NavigateNameRouteApp()),
        ExampleButton(
            text: "Navigate With Argument", widget: NavigateWithArgumentApp()),
        ExampleButton(text: "Pass Data to new Screen", widget: PassDataApp()),
        ExampleButton(
            text: "Network Featch Data", widget: NetworkFeatchDataApp()),
        ExampleButton(text: "My SQLite", widget: MySQLiteApp()),
        ExampleButton(text: "Key Value", widget: KeyValueApp()),
        ExampleButton(text: "Baby Names", widget: BabyNamesApp()),
        ExampleButton(text: "ُُُTts", widget: TtsApp()),
        ExampleButton(text: "Text To Speach", widget: TextToSpeachApp()),
      ],
    );
  }
}
