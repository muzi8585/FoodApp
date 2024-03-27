import 'package:demo/Custom_List.dart';
import 'package:demo/Order/Burger.dart';
import 'package:flutter/material.dart';

class Fried_Chicken extends StatefulWidget {
  const Fried_Chicken({super.key});

  @override
  State<Fried_Chicken> createState() => _Fried_ChickenState();
}

class _Fried_ChickenState extends State<Fried_Chicken> {
final String name="Fried Chicken";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:

      ListView(
        scrollDirection: Axis.vertical,
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
                "Fried Chicken",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),

            ],
          ),
          CustomListItem(
              title: "Hot Wings",
              rating: "8.2 Ratings(987)",
              imageAssetPath: "assests/image/Fried(hot wings).jpg",
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Burgerbill(image: "assests/image/Fried(hot wings).jpg",name:name ,Descr:"Hot Wings", price: 999,);
                  }));
                });
              },
              Price: "Rs.999"),
          CustomListItem(
              title: "Popcorn Chicken",
              rating: "8.23 Ratings(991)",
              imageAssetPath: "assests/image/Fried(popcorn).jpg",
              onTap: () {setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Burgerbill(image: "assests/image/Fried(popcorn).jpg",name: name,Descr: "PopCorn Chicken", price: 899,);
                }));
              });},
              Price: "Rs.899"),
          CustomListItem(
              title: "Golden Fried Chicken",
              rating: "8.6 Ratings(1082)",
              imageAssetPath: "assests/image/Fried(chicken).jpg",
              onTap: () {setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Burgerbill(image: "assests/image/Fried(chicken).jpg",name: name,Descr: "Golden Fried Chicken", price: 849,);
                }));
              });},
              Price: "Rs.849")
        ],
      ),
    );
  }
}
