import 'package:ecommerce_app/Component/SelectColor.dart';
import 'package:ecommerce_app/Component/bottom_navigation.dart';
import 'package:ecommerce_app/Component/counter.dart';
import 'package:ecommerce_app/Provider/Provider.dart';
import 'package:ecommerce_app/Screens/myCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:provider/provider.dart';

import '../Component/gridview.dart';

class DescriptionProduct extends StatefulWidget {
  const DescriptionProduct(
      {super.key,
      required this.name,
      required this.image,
      required this.price});
  final String name;
  final String image;
  final int price;

  @override
  State<DescriptionProduct> createState() => _DescriptionProductState();
}

class _DescriptionProductState extends State<DescriptionProduct> {
  int count = 1;
  bool isVisible = true;
  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 1) {
        count--;
        // Notify the parent widget of the new quantity
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Scaffold(
                appBar: AppBar(
                  leading: Icon(Icons.arrow_back_ios),
                  title: Text(
                    "Detail product",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  centerTitle: true,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyCart()));
                          },
                          icon: Icon(CupertinoIcons.bag)),
                    ),
                  ],
                ),
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: size.height * 0.4,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            widget.image,
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                            Container(
                              height: size.height * 0.44,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(135, 219, 212, 212),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          widget.name,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.19,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 85,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: decrement,
                                                      child: const CircleAvatar(
                                                          backgroundColor:
                                                              Colors.white,
                                                          radius: 12,
                                                          child: Icon(
                                                              CupertinoIcons
                                                                  .minus_circle)),
                                                    ),
                                                    Text(
                                                      "${count}",
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                    GestureDetector(
                                                      onTap: increment,
                                                      child: const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.white,
                                                        radius: 12,
                                                        child: Icon(
                                                            CupertinoIcons
                                                                .add_circled),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Colors.amber,
                                        ),
                                        const Text(
                                          "4.8",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                        const Text(
                                          "(320 Review)",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.316,
                                        ),
                                        const Text(
                                          "Aviable in stock",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 10),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Color",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                    SelectColor(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          "Description",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w800),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, do   tempor incididunt onsectetur adipiscing elit, ut labore et dolore magna aliqua.",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "Ut enim ad minim veniam,sed do eiusmod tempor  ut labore et. Read more",
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: Container(
                  height: size.height * 0.08,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "\$",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "${widget.price}",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: size.width * 0.3,
                      ),
                      InkWell(
                        onTap: () {
                          provider.addTocart(
                              image: widget.image,
                              name: widget.name,
                              price: widget.price,
                              quantity: count);
                          MotionToast.success(
                            description: Text("Add to the Cart"),
                            width: 300,
                            height: 60,
                            title: Text(
                              "Added",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            animationType: AnimationType.fromBottom,
                            position: MotionToastPosition.bottom,
                            animationCurve: Curves.bounceInOut,
                            barrierColor: Colors.grey.withOpacity(0.5),
                          ).show(context);
                        },
                        child: Container(
                          height: size.height * 0.068,
                          width: size.width * 0.44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.deepPurple),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.bag,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: size.height * 0.005,
                                ),
                                Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
