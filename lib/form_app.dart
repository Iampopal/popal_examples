import 'package:flutter/material.dart';

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = "Form Validation";
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  MyCustomForm({Key key}) : super(key: key);

  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  var text = "None";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              text = value;
              if (value.isEmpty) {
                return "Please Enter Some Text";
              }
            },
          ),
          RaisedButton(
            child: Text("Submit"),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("YOUR INPUT IS:- " + text),
                ));
              }
            },
          )
        ],
      ),
    );
  }
}
