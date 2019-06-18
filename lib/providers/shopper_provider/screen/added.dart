import 'package:flutter/material.dart';
import 'package:popal_examples/providers/shopper_provider/model/cart.dart';
import 'package:provider/provider.dart';

class AddedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Added Items'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            Container(height: 4, color: Colors.black),
            _TotalAdded(),
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var carts = Provider.of<MyCartModel>(context);
    var textTheme = Theme.of(context).textTheme.title;

    return ListView(
      children: <Widget>[
        for (var item in carts.items) Text('* ${item.name}', style: textTheme)
      ],
    );
  }
}

class _TotalAdded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.display4.copyWith(fontSize: 42);
    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<MyCartModel>(
              builder: (context, cart, child) => Text(
                    '\$${cart.totalPrice}',
                    style: textTheme,
                  ),
            ),
            SizedBox(width: 12),
            FlatButton(
              child: Text('BUY'),
              color: Colors.white,
              onPressed: () {
                final SnackBar snackBar = SnackBar(
                  content: Text('Buy is not supported yet!'),
                  duration: Duration(seconds: 1),
                  action: SnackBarAction(
                    label: 'OK',
                    textColor: Colors.yellow,
                    onPressed: () {},
                  ),
                );

                Scaffold.of(context).showSnackBar(snackBar);
              },
            )
          ],
        ),
      ),
    );
  }
}
