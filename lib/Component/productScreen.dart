import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        height: 282,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(13)),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/bag2.jpg'))),
                  child: const Stack(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 160.0, top: 13, bottom: 5),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 14,
                        child: Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    )
                  ]),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "The Mirac Jiz",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Lisa Robber",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "\$195.0",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )
          ],
        ),
      )),
    );
  }
}
