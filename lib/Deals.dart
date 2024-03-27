
import 'package:flutter/material.dart';
class Deals extends StatefulWidget {
  const Deals({super.key});

  @override
  State<Deals> createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  int x=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Row(
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back,size: 25,color: Colors.white,),)
              ,SizedBox(width: 110,),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text("Deals",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
              ),
            ],
          ),SizedBox(height: 20,),
          Text("Chicken Chilli with Extra Pizza",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
          SizedBox(height: 10,),
          Container(height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assests/image/new.jpg"),),

            ),),
          SizedBox(height: 20,),
          Text("Tasty, delicious, and has me craving more on the first bite.",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),),
          SizedBox(height: 20,),
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    Text("Quantity",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text("$x",style: TextStyle(color: Colors.white),),
                    TextButton(onPressed: (){
                     setState(() {
                       x++;
                     });
                    }, child: Icon(Icons.add_circle_outline),),
                  ],
                ),
              ),Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Text("|",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  children: [
                    Text("Rating",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text("8.23",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.white,),
                        Icon(Icons.star,color: Colors.white,),
                        Icon(Icons.star,color: Colors.white,),
                        Icon(Icons.star_half_outlined,color: Colors.white,),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
//
//           ElevatedButton(onPressed: (){
// h();
//           }, child: Text("Order Now",style: TextStyle(color: Colors.black),),  style: ElevatedButton.styleFrom(
//     backgroundColor: Colors.white,
//     shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(20))),
//     ),
//
        ElevatedButton(onPressed: (){}, child: Text("Order Now"))

        ],
      ),
    );
  }
}
