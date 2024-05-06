import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './item.dart';
import './order.dart';

class CartProvider extends ChangeNotifier {
  final List<Item> _items = [];
  final List<Item> _favors = [];

  List<Item> get items => _items;

  void add(Item product) {
    if (_items.contains(product) == false) {
      _items.add(product);
      notifyListeners();
    }
  }

  // void addOrder(order element) {
  //   if (_orders.contains(element) == false) {
  //     _orders.add(element);
  //     notifyListeners();
  //   }
  // }

  void remove(Item product) {
    _items.remove(product);
    notifyListeners();
  }

  void like(Item product) {
    product.favor = !product.favor;
    if (product.favor) {
      _favors.add(product);
      notifyListeners();
    } else {
      _favors.remove(product);
      notifyListeners();
    }
  }

  double getCartTotal() {
    return _items.fold(
        0, (previousValue, item) => previousValue + item.price * item.count);
  }

  void increaseCount(product) {
    product.count = product.count + 1;
    notifyListeners();
  }

  void decreaseCount(product) {
    if (product.count > 0) {
      product.count = product.count - 1;
      notifyListeners();
    }
  }

  int getCount() {
    return _items.length;
  }
}
