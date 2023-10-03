import 'package:ecommerce_app/Component/CarusoulSlider.dart';

import 'package:ecommerce_app/Component/gridview.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: SingleChildScrollView(
            child: Container(
              color: Colors.grey[200],
              child: Column(children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/pf.jpg"),
                    ),
                    SizedBox(
                      width: size.width * 0.013,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Hi,Jonathan",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Let's go shopping",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.277,
                    ),
                    const Icon(Icons.search, color: Colors.grey),
                    SizedBox(
                      width: size.width * 0.045,
                    ),
                    const Badge(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(right: 50),
                      child: Icon(
                        Icons.notifications_sharp,
                        color: Colors.amber,
                      ),
                    )
                  ],
                ),
                const TabBar(tabs: [
                  Tab(
                    text: "Home",
                  ),
                  Tab(
                    text: "Category",
                  )
                ]),
                SizedBox(height: 20),
                CarousulSlider(),
                // Custom(),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " New Arrivals ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        "See All",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.0125,
                ),
                Container(child: Product())
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
