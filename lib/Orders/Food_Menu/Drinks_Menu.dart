import 'package:demo/Custom_List.dart';
import 'package:demo/Order/Burger.dart';
import 'package:flutter/material.dart';

import '../../Navigator_bar.dart';


class Drinks_Menu extends StatefulWidget {
  const Drinks_Menu({super.key});

  @override
  State<Drinks_Menu> createState() => _Drinks_MenuState();
}

class _Drinks_MenuState extends State<Drinks_Menu> {
  final String name = "Cold Drinks";
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
                  "Cold Drinks",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )
              ],
            ),
            CustomListItem(
                title: "Coca Cola",
                rating: "8.3 Ratings(674)",
                imageAssetPath: "assests/image/Drink(coca cola).jpg",
                onTap: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Burgerbill(
                        image: "assests/image/Drink(coca cola).jpg",
                        name: name,
                        Descr: "Coca Cola", price: 149,
                      );
                    }));
                  });
                },
                Price: "Rs.149"),
            CustomListItem(
                title: "Pepsi",
                rating: "8.5 Ratings(698)",
                imageAssetPath: "assests/image/Drink(pepsi).jpg",
                onTap: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Burgerbill(
                        image: "assests/image/Drink(pepsi).jpg",
                        name: name,
                        Descr: "Pepsi", price: 139,
                      );
                    }));
                  });
                },
                Price: "Rs.139"),
            CustomListItem(
                title: "Sprite",
                rating: "8.2 Ratings(665)",
                imageAssetPath: "assests/image/Drink(sprite).jpg",
                onTap: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Burgerbill(
                        image: "assests/image/Drink(sprite).jpg",
                        name: name,
                        Descr: "Sprite", price: 149,
                      );
                    }));
                  });
                },
                Price: "Rs.149"),
            CustomListItem(
                title: "Mountain Dew",
                rating: "8.7 Ratings(734)",
                imageAssetPath: "assests/image/Drink(Dew).jpg",
                onTap: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Burgerbill(
                        image: "assests/image/Drink(Dew).jpg",
                        name: name,
                        Descr: "Mountain Dew", price: 139,
                      );
                    }));
                  });
                },
                Price: "Rs.139"),
            CustomListItem(
                title: "Fanta",
                rating: "8.1 Ratings(656)",
                imageAssetPath: "assests/image/Drink(fanta).jpg",
                onTap: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Burgerbill(
                        image: "assests/image/Drink(fanta).jpg",
                        name: name,
                        Descr: "Fanta", price: 139,
                      );
                    }));
                  });
                },
                Price: "Rs.139"),
            CustomListItem(
                title: "Coca Cola Zero",
                rating: "8.3 Ratings(674)",
                imageAssetPath: "assests/image/Drink(zero).jpg",
                onTap: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Burgerbill(
                        image: "assests/image/Drink(zero).jpg",
                        name: name,
                        Descr: "Coca Cola Zero", price: 159,
                      );
                    }));
                  });
                },
                Price: "Rs.159"),
            CustomListItem(
                title: "7Up",
                rating: "8.9 Ratings(798)",
                imageAssetPath: "assests/image/Drinks(7up).jpg",
                onTap: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Burgerbill(
                        image: "assests/image/Drinks(7up).jpg",
                        name: name,
                        Descr: "7Up", price: 139,
                      );
                    }));
                  });
                },
                Price: "Rs.139"),
          ],
        ));
  }
}
