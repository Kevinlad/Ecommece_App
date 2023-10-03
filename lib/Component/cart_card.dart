import 'package:ecommerce_app/Component/counter.dart';
import 'package:ecommerce_app/Model/cart_model.dart';
import 'package:ecommerce_app/Provider/Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCard extends StatefulWidget {
  CartCard(
      {super.key,
      required this.name,
      required this.price,
      required this.image,
      required this.onTap,
      required this.quantity});
  final String name;
  final int price;
  final String image;
  int quantity;

  final Function() onTap;
  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  bool isSelected = false;
  bool isChecked = false;
  // int cartQuantity = 1;
  int get totalPrice => widget.price * widget.quantity;
  void updateCartQuantity(int newQuantity) {
    setState(() {
      widget.quantity = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MyProvider provider = Provider.of<MyProvider>(context);

    return Column(
      children: [
        Center(
          child: Expanded(
            child: Container(
              height: size.height * 0.1875,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Container(
                      height: size.height * 0.125,
                      width: size.width * 0.236,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(widget.image),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Color: ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Berown",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            IconButton(
                              onPressed: widget.onTap,
                              icon: Icon(Icons.delete),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Counter(
                              onCountChanged: (newQuantity) {
                                provider.updateCartItemQuantity(
                                    provider.cartList.indexWhere((item) =>
                                        item.name ==
                                        widget
                                            .name), // Find the item's index by name
                                    newQuantity);
                              },
                              initialValue: widget.quantity,
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Text(
                              "\$",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " ${totalPrice}",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
            height: size.height * 0.0025,
            width: size.width * 0.88,
            decoration: BoxDecoration(color: Colors.grey[300]))
      ],
    );
  }
}
