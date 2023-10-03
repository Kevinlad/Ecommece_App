import 'package:ecommerce_app/Model/favourite_model.dart';
import 'package:ecommerce_app/Provider/favourite_provider.dart';
import 'package:ecommerce_app/Screens/Description.dart';
import 'package:ecommerce_app/Screens/myCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    FavouriteProvider favouriteProvider =
        Provider.of<FavouriteProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text(
          'Favorites',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyCart()));
                },
                icon: Icon(CupertinoIcons.bag)),
          )
        ],
      ),
      body: favouriteProvider.selectedItem.isEmpty
          ? const Center(
              child: Text('No favorite items yet.'),
            )
          : ListView.builder(
              itemCount: favouriteProvider.selectedItem.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DescriptionProduct(
                                      name: favouriteProvider
                                          .selectedItem[index].name,
                                      image: favouriteProvider
                                          .selectedItem[index].image,
                                      price: favouriteProvider
                                          .selectedItem[index].price)));
                        },
                        leading: Image.asset(
                            favouriteProvider.selectedItem[index].image),
                        title: Text(favouriteProvider.selectedItem[index].name),
                        subtitle: Text(
                            '\$${favouriteProvider.selectedItem[index].price}'),
                        trailing: GestureDetector(
                          onTap: () {
                            favouriteProvider.removeFromFavorites(
                                Favourite_Model(
                                    image: favouriteProvider
                                        .selectedItem[index].image,
                                    name: favouriteProvider
                                        .selectedItem[index].name,
                                    price: favouriteProvider
                                        .selectedItem[index].price));
                          },
                          child: Icon(
                            CupertinoIcons.heart_fill,
                            color: favouriteProvider.isFavorite(
                              favouriteProvider.selectedItem[index].name,
                            )
                                ? Colors.red
                                : Colors.white,
                            size: 15,
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
              },
            ),
    );
  }
}
