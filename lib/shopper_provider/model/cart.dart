import 'dart:collection';

import 'package:flutter/foundation.dart';

const _itemsNames = [
  'Code Smell',
  'Control Flow',
  'Interpreter',
  'Recursion',
  'Sprint',
  'Heisenbug',
  'Spaghetti',
  'Hydra Code',
  'Off-By-One',
  'Scope',
  'Callback',
  'Closure',
  'Automata',
  'Bit Shift',
  'Currying',
];

class MyCart extends ChangeNotifier {
  List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  int get totalPrice => _items.length;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }
}

class Item {
  final int id;
  final String name;

  Item(this.id, this.name);

  @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is Item && other.id == id;
}
