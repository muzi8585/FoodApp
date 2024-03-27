import 'package:demo/Custom_List.dart';
import 'package:demo/Order/Burger.dart';
import 'package:flutter/material.dart';
import '../../Navigator_bar.dart';

class Pizza_Menu extends StatefulWidget {
  const Pizza_Menu({super.key});

  @override
  State<Pizza_Menu> createState() => _Pizza_MenuState();
}

class _Pizza_MenuState extends State<Pizza_Menu> {
  final String name = "Pizza";
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
              title: "Chicken Cheese",
              rating: "8.3 Ratings(434)",
              imageAssetPath: "assests/image/pizza.jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/pizza.jpg",
                      name: name,
                      Descr: "Chicken Cheese",
                      price: 1450,
                    );
                  }));
                });
              },
              Price: "Rs.1450"),
          CustomListItem(
              title: "Chicken Fajita",
              rating: "8.7 Ratings(465)",
              imageAssetPath: "assests/image/pizza(fajita).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/pizza(fajita).jpg",
                      name: name,
                      Descr: "Chicken Fajita",
                      price: 1499,
                    );
                  }));
                });
              },
              Price: "Rs.1499"),
          CustomListItem(
              title: "Chicken Tandoori",
              rating: "7.4 Ratings(387)",
              imageAssetPath: "assests/image/pizza(tandori).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/pizza(tandori).jpg",
                      name: name,
                      Descr: "Chicken Tandoori",
                      price: 1299,
                    );
                  }));
                });
              },
              Price: "Rs.1299"),
          CustomListItem(
              title: "Chicken Tikka",
              rating: "9.1 Ratings(502)",
              imageAssetPath: "assests/image/pizza(tikka).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/pizza(tikka).jpg",
                      name: name,
                      Descr: "Chicken Tikka",
                      price: 1599,
                    );
                  }));
                });
              },
              Price: "Rs.1599"),
          CustomListItem(
              title: "Chicken supreme",
              rating: "6.5 Ratings(299)",
              imageAssetPath: "assests/image/pizza(supreme).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/pizza(supreme).jpg",
                      name: name,
                      Descr: "Chicken Supreme",
                      price: 1399,
                    );
                  }));
                });
              },
              Price: "Rs.1399"),
          CustomListItem(
              title: "Chicken special",
              rating: "8.3 Ratings(483)",
              imageAssetPath: "assests/image/pizza(4).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/pizza(4).jpg",
                      name: name,
                      Descr: "Chicken Special",
                      price: 1799,
                    );
                  }));
                });
              },
              Price: "Rs.1799"),
          CustomListItem(
              title: "Chicken Cheese",
              rating: "8.3 Ratings(434)",
              imageAssetPath: "assests/image/pizza.jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/pizza.jpg",
                      name: name,
                      Descr: "Chicken Cheese",
                      price: 1450,
                    );
                  }));
                });
              },
              Price: "Rs.1450"),
          CustomListItem(
              title: "Italian Pizza",
              rating: "9.0 Ratings(489)",
              imageAssetPath: "assests/image/pizza(italian).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/pizza(italian).jpg",
                      name: name,
                      Descr: "Italian Pizza",
                      price: 899,
                    );
                  }));
                });
              },
              Price: "Rs.899"),
        ],
      ),
    );
  }
}
