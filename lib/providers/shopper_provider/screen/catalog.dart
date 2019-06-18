import 'package:flutter/material.dart';
import 'package:popal_examples/providers/shopper_provider/model/cart.dart';
import 'package:provider/provider.dart';

class CatelogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _MyAppBar(),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (_, index) => _MyCartList(index: index)))
        ],
      ),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Catelog', style: Theme.of(context).textTheme.display4),
      floating: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.pushNamed(context, '/added');
          },
        ),
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  final item;
  const _AddButton({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chart = Provider.of<MyCartModel>(context);
    return FlatButton(
      onPressed: chart.items.contains(item)
          ? () => chart.removeItem(item)
          : () => chart.addItem(item),
      splashColor: Theme.of(context).primaryColor,
      child: chart.items.contains(item)
          ? Icon(Icons.check)
          : Text('ADD'),
    );
  }
}

class _MyCartList extends StatelessWidget {
  final int index;
  const _MyCartList({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.title;
    var item = Item(index);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.primaries[index % Colors.primaries.length],
              ),
            ),
            SizedBox(width: 24),
            Expanded(
              child: Text(item.name, style: textTheme),
            ),
            SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}
