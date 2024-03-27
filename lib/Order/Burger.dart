/*
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../Food_Items_class.dart';

class Burgerbill extends StatefulWidget {
  final String image;
  final String name;
  final String Descr;
  const Burgerbill(
      {Key? key, required this.image, required this.name, required this.Descr});

  @override
  State<Burgerbill> createState() => _BurgerbillState();
}

class _BurgerbillState extends State<Burgerbill> {
  int quantity = 1;
  List<Food_Items> cartitems=[];

  void Addcart(){
    setState(() {
      cartitems.add(Food_Items(Name: widget.name, Descr: widget.Descr, Image: widget.image, Quantity: quantity));
    });
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: cartitems.length,
        channelKey: "Basic Channel",
        title: "Item Added to Cart",
        body: "${widget.name} has been added to your cart.",
      ),
    );
  }

  @override
  Widget build(BuildContext context)
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 80),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            widget.Descr,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.image),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Tasty, delicious, and has me craving more on the first bite.",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Text(
                      "Quantity",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (quantity > 0) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                          icon: Icon(Icons.remove_circle_outline),
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "$quantity",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: Icon(Icons.add_circle_outline),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  "|",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  children: [
                    Text(
                      "Rating",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.white),
                        Icon(Icons.star, color: Colors.white),
                        Icon(Icons.star, color: Colors.white),
                        Icon(Icons.star_half_outlined, color: Colors.white),
                      ],
                    ),
                    Text(
                      "8.23",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: Addcart,
             */
/* AwesomeNotifications().createNotification(
                content: NotificationContent(
                  id: 1,
                  channelKey: "Basic Channel",
                  title: "Fast Food ",
                  body: "You'll get your Order in 25 min...",
                ),
              );*/ /*


            child: Text("Add to Cart"),
          ),
          SizedBox(height: 20),
          // Display the list of food items in the cart
          ListView.builder(
  shrinkWrap: true,
  itemCount: cartitems.length,
  itemBuilder: (context, index) {
  return ListTile(
  leading: Image.asset(cartitems[index].Image),
  title: Text(cartitems[index].Name),
  subtitle: Text(cartitems[index].Descr),
  trailing: Text("Quantity: ${cartitems[index].Quantity}"),
  );
  },
  ),
        ],
      ),
    );
  }

*/
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Food_Items_class.dart';

class Burgerbill extends StatefulWidget {
  final String image;
  final String name;
  final String Descr;
  final int price;



  Burgerbill(
      {Key? key, required this.image, required this.name, required this.Descr, required this.price});

  @override
  State<Burgerbill> createState() => _BurgerbillState();
}

class _BurgerbillState extends State<Burgerbill> {
  int quantity = 1;
  List<Food_Items> cartitems = [];
  final databaseref = FirebaseDatabase.instance.ref();

  void Addcart() {

    setState(() {
      cartitems.add(Food_Items(
        Name: widget.name,
        Descr: widget.Descr,
        Image: widget.image,
        Quantity: quantity,
        Price: widget.price,
      ));
    });
    Fluttertoast.showToast(msg: "Added to the Cart");
   /* AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: cartitems.length,
        channelKey: "Basic Channel",
        title: "Item Added to Cart",
        body: "${widget.name} has been added to your cart.",
      ),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 80),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            widget.Descr,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.image),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Tasty, delicious, and has me craving more on the first bite.",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Price:",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
              Text(" Rs.${widget.price}",style: TextStyle(color: Colors.grey,fontSize: 25),)
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Text(
                      "Quantity",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (quantity > 0) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                          icon: Icon(Icons.remove_circle_outline),
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "$quantity",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: Icon(Icons.add_circle_outline),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  "|",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  children: [
                    Text(
                      "Rating",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.white),
                        Icon(Icons.star, color: Colors.white),
                        Icon(Icons.star, color: Colors.white),
                        Icon(Icons.star_half_outlined, color: Colors.white),
                      ],
                    ),
                    Text(
                      "8.23",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              String? id = databaseref.child('Cart Items').push().key;
              Map<String, dynamic> newItem = {
                'id': id,
                'Name': widget.name,
                'Descr': widget.Descr,
                'Image': widget.image,
                'Quantity': quantity,
                'Price': widget.price,
              };
              databaseref.child('Cart Items').child(id.toString()).set(newItem).then((_) {
                Fluttertoast.showToast(msg: "Added to cart");
                Addcart();
              }).catchError((error) {
                Fluttertoast.showToast(msg: "Failed to add to cart: $error");
              });
            },
            child: Text("Add to Cart"),
          ),

        ],
      ),
    );
  }
}
