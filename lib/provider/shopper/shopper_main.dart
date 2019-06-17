import 'package:flutter/material.dart';
import 'package:popal_examples/provider/shopper/model/cart.dart';
import 'package:popal_examples/provider/shopper/screen/cart.dart';
import 'package:popal_examples/provider/shopper/screen/catalog.dart';
import 'package:popal_examples/provider/shopper/screen/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyAppShopper());
}

class MyAppShopper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          textTheme: TextTheme(
            display4: TextStyle(
              fontFamily: 'Corben',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MyLoginScreen(),
          '/catalog': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}
