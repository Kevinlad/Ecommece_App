import 'package:ecommerce_app/Screens/Home.dart';
import 'package:ecommerce_app/Screens/favourite_page.dart';
import 'package:ecommerce_app/Screens/myCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  final bottomnavigationbarItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: Colors.grey,
      ),
      label: "Home",
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.shopping_cart,
          color: Colors.grey,
        ),
        label: "Cart"),
    const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.heart,
          color: Colors.grey,
        ),
        label: "Favourite"),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          color: Colors.grey,
        ),
        label: "My Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          // scrollDirection: Axis.horizontal,
          controller: _pageController,
          onPageChanged: (newvalue) {
            setState(() {
              _currentIndex = newvalue;
            });
          },
          children: [Home(), MyCart(), FavoritesPage()]),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomnavigationbarItems,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        },
      ),
    );
  }
}
