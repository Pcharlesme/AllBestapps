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
}
