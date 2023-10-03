import 'package:flutter/material.dart';
import 'package:ecommerce_app/Model/cart_model.dart';

class MyProvider extends ChangeNotifier {
  List<Cart_Model> cartList = [];
  List<Cart_Model> newCartList = [];
  List<Cart_Model> selectedCartItems = [];
  late Cart_Model cartModule;
  void addTocart(
      {required String image,
      required String name,
      required int price,
      required int quantity}) {
    cartModule =
        Cart_Model(image: image, name: name, price: price, quantity: quantity);
    newCartList.add(cartModule);
    cartList = newCartList;
  }

  get throwCartList {
    return cartList;
  }

  int totalprice() {
    int total = 0;
    cartList.forEach((element) {
      total = total + element.price * element.quantity;
    });
    return total;
  }
  // int totalprice() {
  //   int total = 0;
  //   for (var item in selectedCartItems) {
  //     total += item.price;
  //   }
  //   return total;
  // }

  late int deleteIndex;
  void getDeleteIndex(int index) {
    deleteIndex = index;
  }

  void delete() {
    cartList.removeAt(deleteIndex);

    notifyListeners();
  }

  void updateCartItemQuantity(int index, int newQuantity) {
    if (index >= 0 && index < cartList.length) {
      cartList[index].quantity = newQuantity;
      notifyListeners();
    }
  }
}
