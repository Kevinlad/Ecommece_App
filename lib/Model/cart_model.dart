import 'package:flutter/cupertino.dart';

class Cart_Model {
  final String image;
  final String name;
  final int price;
  int quantity;
  Cart_Model(
      {required this.quantity,
      required this.image,
      required this.name,
      required this.price});
}
