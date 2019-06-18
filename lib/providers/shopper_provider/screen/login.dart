import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.display4,
              ),
              SizedBox(height: 24),
              _LoginTextField(
                hint: 'login',
              ),
              SizedBox(height: 12),
              _LoginTextField(hint: 'Password', obsecure: true),
              SizedBox(height: 12),
              FlatButton(
                color: Colors.yellow,
                child: Text('ENTER'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/catelog');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginTextField extends StatelessWidget {
  final bool obsecure;
  final String hint;
  const _LoginTextField({Key key, this.hint, this.obsecure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: hint, fillColor: Colors.black12),
      obscureText: obsecure,
    );
  }
}
