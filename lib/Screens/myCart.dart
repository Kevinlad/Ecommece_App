import 'package:ecommerce_app/Component/bottom_navigation.dart';
import 'package:ecommerce_app/Component/cart_card.dart';
import 'package:ecommerce_app/Model/cart_model.dart';
import 'package:ecommerce_app/Provider/Provider.dart';
import 'package:ecommerce_app/Screens/Description.dart';
import 'package:ecommerce_app/Screens/Home.dart';
import 'package:ecommerce_app/Screens/favourite_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    int total = provider.totalprice();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: const Text(
          "My Cart",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomNavigation()));
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FavoritesPage()));
                },
                icon: Icon(CupertinoIcons.heart_circle_fill)),
          )
        ],
      ),
      body: provider.cartList.isEmpty
          ? const Center(
              child: Text('No Cart items yet.'),
            )
          : SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Scaffold(
                    backgroundColor: Colors.grey[200],
                    bottomNavigationBar: Container(
                      margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ $total",
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                          const Text(
                            "Check Out",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    body: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: provider.cartList.length,
                            itemBuilder: (ctx, index) {
                              provider.getDeleteIndex(index);
                              return CartCard(
                                image: provider.cartList[index].image,
                                name: provider.cartList[index].name,
                                price: provider.cartList[index].price,
                                quantity: provider.cartList[index].quantity,
                                onTap: () {
                                  provider.delete();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ))),
    );
  }
}
