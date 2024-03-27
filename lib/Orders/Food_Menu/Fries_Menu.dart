import 'package:demo/Custom_List.dart';
import 'package:flutter/material.dart';
import '../../Order/Burger.dart';

class Friess_Menu extends StatefulWidget {
  const Friess_Menu({super.key});

  @override
  State<Friess_Menu> createState() => _Friess_MenuState();
}

class _Friess_MenuState extends State<Friess_Menu> {
  final String name = "Friess";
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
              title: "Loaded Chilli Fries",
              rating: "8.5 Ratings(425)",
              imageAssetPath: "assests/image/fries(loaded chili).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/fries(loaded chili).jpg",
                      name: name,
                      Descr: "Loaded Chilli Friess",
                      price: 499,
                    );
                  }));
                });
              },
              Price: "Rs.499"),
          CustomListItem(
              title: "Schezwan Fries",
              rating: "8.1 Ratings(401)",
              imageAssetPath: "assests/image/fires(Schezwan).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/fires(Schezwan).jpg",
                      name: name,
                      Descr: "Schezwan Friess",
                      price: 699,
                    );
                  }));
                });
              },
              Price: "Rs.699"),
          CustomListItem(
              title: "Loaded Cheese Fries",
              rating: "8.2 Ratings(410)",
              imageAssetPath: "assests/image/fires(cheese).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/fires(cheese).jpg",
                      name: name,
                      Descr: "Loaded Cheese Friess",
                      price: 749,
                    );
                  }));
                });
              },
              Price: "Rs.749"),
          CustomListItem(
              title: "Chilli Cheese Waffle Fries",
              rating: "8.5 Ratings(456)",
              imageAssetPath: "assests/image/fries(cheese waffle).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/fries(cheese waffle).jpg",
                      name: name,
                      Descr: "Chilli Cheese Waffle Firess",
                      price: 799,
                    );
                  }));
                });
              },
              Price: "Rs.799"),
          CustomListItem(
              title: "Loaded Blooming Onion Fries",
              rating: "7.9 Ratings(398)",
              imageAssetPath: "assests/image/fires(onion).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/fires(onion).jpg",
                      name: name,
                      Descr: "Loaded Blooming Onion Friess",
                      price: 649,
                    );
                  }));
                });
              },
              Price: "Rs.649"),
          CustomListItem(
              title: "Homemade BBQ French Fries",
              rating: "8.8 Ratings(487)",
              imageAssetPath: "assests/image/fires(BBQ).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/fires(BBQ).jpg",
                      name: name,
                      Descr: "Homemade BBQ French Friess",
                      price: 849,
                    );
                  }));
                });
              },
              Price: "Rs.849"),
          CustomListItem(
              title: "Masala Fries",
              rating: "8.9 Ratings(498)",
              imageAssetPath: "assests/image/fires(masala).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/fires(masala).jpg",
                      name: name,
                      Descr: "Masala Friess",
                      price: 399,
                    );
                  }));
                });
              },
              Price: "Rs.399"),
          CustomListItem(
              title: "Truffle Fries",
              rating: "8.0 Ratings(468)",
              imageAssetPath: "assests/image/fries(Truffle).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Burgerbill(
                      image: "assests/image/fries(Truffle).jpg",
                      name: name,
                      Descr: "Truffle Friess",
                      price: 449,
                    );
                  }));
                });
              },
              Price: "Rs.449"),
        ],
      ),
    );
  }
}
