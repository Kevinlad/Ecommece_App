import 'package:ecommerce_app/Component/bottom_navigation.dart';
import 'package:ecommerce_app/Component/cart_card.dart';

import 'package:ecommerce_app/Component/productScreen.dart';
import 'package:ecommerce_app/Model/bag_model.dart';
import 'package:ecommerce_app/Provider/cart_provider.dart';
import 'package:ecommerce_app/Provider/favourite_provider.dart';
import 'package:ecommerce_app/Screens/Description.dart';
import 'package:ecommerce_app/Screens/Home.dart';
import 'package:ecommerce_app/Screens/favourite_page.dart';
import 'package:ecommerce_app/Screens/myCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: BottomNavigation()),
    );
  }
}
