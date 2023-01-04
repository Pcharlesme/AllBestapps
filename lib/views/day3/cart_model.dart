import 'package:flutter/material.dart';
import 'package:testappbc/const/assets_path.dart';

class CartModel extends ChangeNotifier {
  //list of item on sale

  final List _shopItems = [
    //itemname, price image, color

    ["Avacado", "12", grocy, Colors.green],
    ["Avacado", "32", grocy1, Colors.yellow],
    ["Avacado", "76", grocy2, Colors.brown],
    ["Avacado", "30", grocy3, Colors.blue],
  ];

  get shopitem => _shopItems;

  //list of cart item
  List _cartItems = [];

  get cartItems => _cartItems;

  // add item to cart

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //cal total price
  String calculateTotal() {
    double totalprice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalprice += double.parse(_cartItems[i][1]);
    }
    return totalprice.toStringAsFixed(2);
  }
}
