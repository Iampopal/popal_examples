import 'package:flutter/material.dart';

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = "Form Validation";
    return MaterialApp(
      title: appTitle,
      home: new FormDemo(appTitle: appTitle),
    );
  }
}

class FormDemo extends StatelessWidget {
  const FormDemo({
    Key key,
    @required this.appTitle,
  }) : super(key: key);

  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: MyCustomForm(),
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
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  TextFormField(
                    controller: textEditingController,
                    validator: (value) {
                      text = value;
                      if (value.isEmpty) {
                        return "Please Enter Some Text";
                      }
                    },
                    decoration: InputDecoration(hintText: "Your message..."),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text("Submit"),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          //* Show Toast
                          // Scaffold.of(context).showSnackBar(SnackBar(
                          //   content: Text("Welcome" + text),
                          // ));

                          var route = MaterialPageRoute(
                              builder: (context) => SubmitedData(text: text));
                          Navigator.push(context, route);

                          textEditingController.clear();
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SubmitedData extends StatelessWidget {
  const SubmitedData({Key key, this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Submited"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(fontSize: 32),
            ),
            RaisedButton(
              child: Text("Tray Agion"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
