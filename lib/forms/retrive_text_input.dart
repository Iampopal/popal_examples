import 'package:flutter/material.dart';

class RetriveTextFieldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String appTitle = 'Retrive Text from Text Field';
    return MaterialApp(
      title: appTitle,
      home: CustomForm(appTitle: appTitle),
    );
  }
}

class CustomForm extends StatefulWidget {
  final String appTitle;
  CustomForm({Key key, this.appTitle});

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  TextEditingController textEditingController;

  _printLastestValue() {
    print('Second Text Field Value: ${textEditingController.text}');
  }

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();

    textEditingController.addListener(_printLastestValue());
  }

  @override
  void dispose() {
    textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (text) {
                  print('First TextField: $text');
                },
                decoration: InputDecoration(labelText: 'First Text Field'),
              ),
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(labelText: 'Second Text Field'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            child: Icon(Icons.check),
            onPressed: () {
              SnackBar snackBar = SnackBar(
                content:
                    Text('Second Text Value: ${textEditingController.text}'),
                action: SnackBarAction(
                  label: 'OK',
                  onPressed: () {},
                ),
              );

              Scaffold.of(context).showSnackBar(snackBar);

              print('Check clicked!!!');
            },
          );
        },
      ),
    );
  }
}
