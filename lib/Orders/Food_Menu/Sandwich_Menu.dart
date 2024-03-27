import 'package:demo/Custom_List.dart';
import 'package:demo/Order/Burger.dart';

import 'package:flutter/material.dart';

import '../../Navigator_bar.dart';

class Sandwich_Menu extends StatefulWidget {
  const Sandwich_Menu({super.key});

  @override
  State<Sandwich_Menu> createState() => _Sandwich_MenuState();
}

class _Sandwich_MenuState extends State<Sandwich_Menu> {
  final String name="Sandwich";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Stack(
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
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, top: 10),
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ],
          ),
          CustomListItem(
              title: "Ham Sandwich",
              rating: "7.7 Ratings(467)",
              imageAssetPath: "assests/image/sandwich.jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(image: "assests/image/sandwich.jpg",name: name,Descr: "Ham Sandwich", price: 649,);
                  }));
                });
              },
              Price: "Rs.649"),
          CustomListItem(
              title: "Club Sandwich",
              rating: "7.4 Ratings(401)",
              imageAssetPath: "assests/image/sandwich(club).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                        image: "assests/image/sandwich(club).jpg",name: name,Descr: "Club Sandwich", price: 799,);
                  }));
                });
              },
              Price: "Rs.799"),
          CustomListItem(
              title: "Stacked Vegetarian Sandwich",
              rating: "8.3 Ratings(571)",
              imageAssetPath: "assests/image/sandwich(steak vegetarian).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                        image: "assests/image/sandwich(steak vegetarian).jpg",name: name,Descr: "Stacked Vegetarian Sandwich", price: 999,);
                  }));
                });
              },
              Price: "Rs.999"),
          CustomListItem(
              title: "Philly Cheesesteak Sandwich",
              rating: "7.6 Ratings(455)",
              imageAssetPath: "assests/image/sandwich(philly cheesesteak).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                        image:
                            "assests/image/sandwich(philly cheesesteak).jpg",name: name,Descr: "Philly Cheesestack Sandwich", price: 1099,);
                  }));
                });
              },
              Price: "Rs.1099"),
          CustomListItem(
              title: "Toasted BLT Sandwich",
              rating: "8.9 Ratings(601)",
              imageAssetPath: "assests/image/sandwich(toasted BLT).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                        image: "assests/image/sandwich(toasted BLT).jpg",name: name,Descr: "Toasted BLT Sandwich", price: 1149,);
                  }));
                });
              },
              Price: "Rs.1149"),
          CustomListItem(
              title: "Grilled Cuban Sandwich",
              rating: "7.9 Ratings(490)",
              imageAssetPath: "assests/image/sandwich(grilled cuban).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                        image: "assests/image/sandwich(grilled cuban).jpg",name: name,Descr: "Grilled Cuban Sandwich", price: 649,);
                  }));
                });
              },
              Price: "Rs.649"),
          CustomListItem(
              title: "Roast Chicken Sandwich",
              rating: "8.1 Ratings(501)",
              imageAssetPath: "assests/image/sandwich(roast chicken).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                        image: "assests/image/sandwich(roast chicken).jpg",name: name,Descr: "Roast Chicken Sandwich", price: 899,);
                  }));
                });
              },
              Price: "Rs.899"),
          CustomListItem(
              title: "Ham and Cheese Sandwich",
              rating: "7.1 Ratings(389)",
              imageAssetPath: "assests/image/sandwich(ham&cheese).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                        image: "assests/image/sandwich(ham&cheese).jpg",name: name,Descr: "Ham and Cheese Sandwich", price: 599,);
                  }));
                });
              },
              Price: "Rs.599")
        ],
      ),
    );
  }
}
