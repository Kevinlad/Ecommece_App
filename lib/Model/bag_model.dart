import 'package:flutter/cupertino.dart';

class BagModel {
  final String image;
  final String name;
  final int price;
  final String title;
  BagModel(
      {required this.image,
      required this.name,
      required this.price,
      required this.title});
}

var Bag_model = [
  BagModel(
      image: "assets/images/sn4.jpg",
      name: "Black Bag Women",
      price: 32,
      title: "Lisa Robber"),
  BagModel(
      image: "assets/images/bag6.jpg",
      name: "grey Bag Women",
      price: 28,
      title: "KC Carri"),
  BagModel(
      image: "assets/images/sn2.webp",
      name: "Slim Sun Glasses",
      price: 20,
      title: "Ryban"),
  BagModel(
      image: "assets/images/sn6.jpg",
      name: "Black Sun Glasses ",
      price: 18,
      title: "Ryban"),
  BagModel(
      image: "assets/images/mb1.jpg",
      name: "Iphone Back Cover",
      price: 12,
      title: "Show 45"),
  BagModel(
      image: "assets/images/mb3.webp",
      name: "Iphone brown Strip",
      price: 14,
      title: "GD Carry"),
  BagModel(
      image: "assets/images/lp3.webp",
      name: "Grey Laptop Cover ",
      price: 17,
      title: "Cotton Fab"),
  BagModel(
      image: "assets/images/lp.jpg",
      name: " Laptop Cover ",
      price: 15,
      title: "Cotton Fab"),
];
