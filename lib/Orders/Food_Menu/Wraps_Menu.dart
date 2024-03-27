import 'package:demo/Order/Burger.dart';

import 'package:flutter/material.dart';
import '../../Custom_List.dart';
import '../../Navigator_bar.dart';

class Wraps_Menu extends StatefulWidget {
  const Wraps_Menu({super.key});

  @override
  State<Wraps_Menu> createState() => _Wraps_MenuState();
}

class _Wraps_MenuState extends State<Wraps_Menu> {
  final String name = "Wraps";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return DEMO();
                  }));
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )
            ],
          ),
          CustomListItem(
              title: "Chicken Wrap",
              rating: "8.2 Ratings(674)",
              imageAssetPath: "assests/image/Wrap(Chicken).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/Wrap(Chicken).jpg",
                      name: name,
                      Descr: "Chicken Wrap",
                      price: 699,
                    );
                  }));
                });
              },
              Price: "Rs.699"),
          CustomListItem(
              title: "Falafel in Tortila Wrap",
              rating: "7.4 Ratings(567)",
              imageAssetPath: "assests/image/Wrap(Falafel).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/Wrap(Falafel).jpg",
                      name: name,
                      Descr: "Falafel in  Tortila Wrap",
                      price: 999,
                    );
                  }));
                });
              },
              Price: "Rs.999"),
          CustomListItem(
              title: "Chicken Fajita Wrap",
              rating: "8.9 Ratings(786)",
              imageAssetPath: "assests/image/Wrap(fajita).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/Wrap(fajita).jpg",
                      name: name,
                      Descr: "Chicken Fajita ",
                      price: 899,
                    );
                  }));
                });
              },
              Price: "Rs.899"),
          CustomListItem(
              title: "Tacos with Beef Wrap",
              rating: "9.1 Ratings(832)",
              imageAssetPath: "assests/image/Wrap(beef).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/Wrap(beef).jpg",
                      name: name,
                      Descr: "Tacos with Beef",
                      price: 949,
                    );
                  }));
                });
              },
              Price: "Rs.949"),
          CustomListItem(
              title: "Egg and Turkey Bacon Wrap",
              rating: "7.4 Ratings(563)",
              imageAssetPath: "assests/image/Wrap(Egg).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/Wrap(Egg).jpg",
                      name: name,
                      Descr: "Egg and Turkey Bacon",
                      price: 499,
                    );
                  }));
                });
              },
              Price: "Rs.499"),
          CustomListItem(
              title: "Turkish Shawarma Wrap",
              rating: "8.5 Ratings(690)",
              imageAssetPath: "assests/image/Wrap(Turkish).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/Wrap(Turkish).jpg",
                      name: name,
                      Descr: "Turkish Shawarma",
                      price: 799,
                    );
                  }));
                });
              },
              Price: "Rs.799"),
          CustomListItem(
              title: "Tortila Wrap with Vegetables",
              rating: "8.0 Ratings(645)",
              imageAssetPath: "assests/image/Wrap(Vegetable).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/Wrap(Vegetable).jpg",
                      name: name,
                      Descr: "Tortila Wrap with Vegetables",
                      price: 399,
                    );
                  }));
                });
              },
              Price: "Rs.399")
        ],
      ),
    );
  }
}
