import 'package:flutter/material.dart';
import 'package:popal_examples/providers/shopper_provider/model/cart.dart';
import 'package:popal_examples/providers/shopper_provider/screen/added.dart';
import 'package:popal_examples/providers/shopper_provider/screen/catalog.dart';
import 'package:popal_examples/providers/shopper_provider/screen/login.dart';
import 'package:provider/provider.dart';

class MyShopperProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => MyCartModel(),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopper Provider',
      theme: ThemeData(
        primaryColor: Colors.yellow,
        textTheme: TextTheme(
          display4: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/catelog': (context) => CatelogScreen(),
        '/added': (context) => AddedScreen(),
      },
    );
  }
}
