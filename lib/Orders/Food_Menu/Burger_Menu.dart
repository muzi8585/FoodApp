import 'package:demo/Custom_List.dart';
import 'package:flutter/material.dart';


import '../../Order/Burger.dart';

class Burger_Menu extends StatefulWidget {
  const Burger_Menu({super.key});

  @override
  State<Burger_Menu> createState() => _Burger_MenuState();
}

class _Burger_MenuState extends State<Burger_Menu> {
  final String name = "Burger";

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
                  Navigator.pop(context);
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
              )
            ],
          ),
          CustomListItem(
              title: "Chicken Fillet",
              rating: "8.8 Ratings(467)",
              imageAssetPath: "assests/image/burger.jpg",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Burgerbill(
                    image: 'assests/image/burger.jpg',
                    name: name,
                    Descr: 'Chicken Fillet', price: 450,
                  );
                }));
              },
              Price: "Rs.450"),
          CustomListItem(
            title: "Chicken Shami",
            rating: "7.4 Ratings(401)",
            imageAssetPath: "assests/image/shami.jpg",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Burgerbill(image: 'assests/image/shami.jpg', name: name,Descr: "Chicken Shami", price: 199,);
              }));
            },
            Price: "Rs.199",
          ),
          CustomListItem(
              title: "Chicken Cheese",
              rating: "8.4 Ratings(474)",
              imageAssetPath: "assests/image/cheese.jpg",
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return Burgerbill(
                     image: 'assests/image/cheese.jpg',
                     name: name,
                     Descr: "Chicken Cheese", price: 999,
                   );
                 }));
              },
              Price: "Rs.999"),
          CustomListItem(
              title: "Beef Buger",
              rating: "8.9 Ratings(504)",
              imageAssetPath: "assests/image/beef.jpg",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Burgerbill(
                    image: 'assests/image/beef.jpg',
                    name: name,
                    Descr: "Beef Burger", price: 1299,
                  );
                }));
              },
              Price: "Rs.1299"),
          CustomListItem(
              title: "Zinger",
              rating: "9.1 Ratings(545)",
              imageAssetPath: "assests/image/zinger.jpg",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Burgerbill(
                    image: 'assests/image/zinger.jpg',
                    name: name,
                    Descr: "Zinger", price: 599,
                  );
                }));
              },
              Price: "Rs.599"),
          CustomListItem(
              title: "Beef Cheese",
              rating: "7.9 Ratings(409)",
              imageAssetPath: "assests/image/beefcheese.jpg",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Burgerbill(
                    image: 'assests/image/beefcheese.jpg',
                    name: name,
                    Descr: "Beef Cheese", price: 899,
                  );
                }));
              },
              Price: "Rs.899"),
          CustomListItem(
              title: "HamBurger",
              rating: "7.6 Ratings(376)",
              imageAssetPath: "assests/image/hamburger.jpg",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Burgerbill(
                    image: 'assests/image/hamburger.jpg',
                    name: name,
                    Descr: "HamBurger", price: 399,
                  );
                }));
              },
              Price: "Rs.399"),
          CustomListItem(
              title: "Hamburger with Beef cutlets",
              rating: "8.1 Ratings(432)",
              imageAssetPath: "assests/image/hambeef.jpg",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Burgerbill(
                    image: 'assests/image/hamburger.jpg',
                    name: name,
                    Descr: "HamBurger", price: 1799,
                  );
                }));
              },
              Price: "Rs.1799"),
        ],
      ),
    );
  }
}
