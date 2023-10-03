import 'package:flutter/cupertino.dart';

class Favourite_Model {
  final String image;
  final String name;
  final int price;
  Favourite_Model(
      {required this.image, required this.name, required this.price});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Favourite_Model &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
