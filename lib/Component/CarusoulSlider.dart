import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarousulSlider extends StatefulWidget {
  CarousulSlider({super.key});

  @override
  State<CarousulSlider> createState() => _CarousulSliderState();
}

class _CarousulSliderState extends State<CarousulSlider> {
  final List<String> imgList = [
    'https://img.freepik.com/premium-vector/elegant-mid-year-sale-discount-template-banner-with-blank-space-product-with-abstract-gradient-white-grey-background-design_727967-188.jpg?w=2000',
    'https://img.freepik.com/premium-vector/special-offer-new-year-sale-discount-template-banner-with-blank-space-product-with-abstract-gradient-white-grey-background-design_727967-218.jpg',
    'https://img.freepik.com/premium-vector/elegant-summer-sale-banner-with-blank-space-product-with-abstract-gradient-white-background-design_727967-191.jpg'
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width * 0.833,
            child: SizedBox(
              height: size.height * 0.1625,
              child: CarouselSlider(
                items: imgList.map((item) {
                  return Container(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 0.01, // Adjust aspect ratio as needed
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map((url) {
            int index = imgList.indexOf(url);
            return Container(
              width: size.width * 0.022,
              height: size.height * 0.01,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Colors.blue
                    : Colors.grey, // Customize the dot colors
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
