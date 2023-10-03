import 'package:ecommerce_app/Component/cart_card.dart';
import 'package:ecommerce_app/Model/bag_model.dart';
import 'package:ecommerce_app/Model/favourite_model.dart';
import 'package:ecommerce_app/Provider/cart_provider.dart';
import 'package:ecommerce_app/Provider/favourite_provider.dart';
import 'package:ecommerce_app/Screens/Description.dart';
import 'package:ecommerce_app/Screens/favourite_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product extends StatefulWidget {
  Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<bool> isFavorite = List.generate(Bag_model.length, (index) => false);
  List<Favourite_Model> favoriteItems = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FavouriteProvider favouriteProvider =
        Provider.of<FavouriteProvider>(context);
    return Consumer(builder: (context, value, child) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: SingleChildScrollView(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              mainAxisExtent: 255,
            ),
            itemCount: Bag_model.length,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DescriptionProduct(
                                name: Bag_model[index].name,
                                image: Bag_model[index].image,
                                price: Bag_model[index].price,
                              )));
                },
                child: Container(
                  height: 262,
                  width: 185,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(13)),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: size.height * 0.2,
                            width: size.width * 0.55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23),
                                image: DecorationImage(
                                    image: AssetImage(Bag_model[index].image),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center)),
                            child: Stack(children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 120.0, top: 13, bottom: 5, right: 7),
                                child: GestureDetector(
                                  onTap: () {
                                    favouriteProvider.toggleFavorite(
                                        Favourite_Model(
                                            image: Bag_model[index].image,
                                            name: Bag_model[index].name,
                                            price: Bag_model[index].price));
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 14,
                                    child: Icon(
                                      CupertinoIcons.heart_fill,
                                      color: favouriteProvider.isFavorite(
                                        Bag_model[index]
                                            .name, // Assuming 'name' is a unique identifier for items
                                      )
                                          ? Colors.red
                                          : Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        Bag_model[index].name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        Bag_model[index].title,
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "\$${Bag_model[index].price}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
