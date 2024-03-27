

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:demo/About.dart';
import 'package:demo/CustomDealitems.dart';
import 'package:demo/CustomInkWell.dart';

import 'package:demo/LoginPage.dart';
import 'package:demo/Map.dart';
import 'package:demo/Order/Burger.dart';
import 'package:demo/Orders/Food_Menu/Burger_Menu.dart';
import 'package:demo/Orders/Food_Menu/Drinks_Menu.dart';
import 'package:demo/Orders/Food_Menu/Fried_Chicken.dart';
import 'package:demo/Orders/Food_Menu/Fries_Menu.dart';
import 'package:demo/Orders/Food_Menu/Pizza_Menu.dart';
import 'package:demo/Orders/Food_Menu/Sandwich_Menu.dart';
import 'package:demo/Orders/Food_Menu/Wraps_Menu.dart';
import 'package:demo/Profile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'Food_Items_class.dart';
import 'NotificationController.dart';

class Dashbaord extends StatefulWidget {
  const Dashbaord({super.key});
  @override
  State<Dashbaord> createState() => _DashbaordState();
}

class _DashbaordState extends State<Dashbaord> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final Color color = Colors.grey;
  final databaseref = FirebaseDatabase.instance.ref("Data");
  List<Food_Items> cartitems = [];

  void initState() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionRecieveMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionRecieveMethod,
    );
    super.initState();
  }
  final mapscreen=MapS();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        backgroundColor: Colors.black,
        drawer: Drawer(
          child: Container(
              color: Colors.black,
              child: SafeArea(
                child: Column(
                  children: [
                    /*  UserAccountsDrawerHeader(accountName: , accountEmail: ),*/

                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Profile",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      selectedTileColor: color,
                      onTap: () {
/*Profile();*/Navigator.push(context, MaterialPageRoute(builder: (context){
  return Profile();
                        }));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.map_outlined,color: Colors.white,),
                      title: Text(
                        "Find Near",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),selectedTileColor: color,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return mapscreen;
                        }));
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                      title: Text(
                        "About",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      selectedTileColor: color,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){return About();}));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 200, left: 100),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Login();
                              }));
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                (Icons.logout),
                                size: 30,
                                color: Colors.white,
                              ),
                              Text(
                                "Logout",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              )),
        ),
        body: Stack(
          children: [
            /*Image(
          image: AssetImage("assests/image/4.jpg"),
          fit: BoxFit.cover,
          height: 1000,
        ),*/
            Padding(
              padding: EdgeInsets.only(left: 10, top: 30),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _globalKey.currentState!.openDrawer();
                    });
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 130, top: 50),
              child: Text(
                "Food App",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.only(left: 300, top: 30),
              child: IconButton(
                  onPressed: () {
                    *//*  setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Search();
                      }));
                    });*//*
                  },
                  icon: Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 30,
                  )),
            ),*/
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 150,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        image: DecorationImage(
                          image: AssetImage(
                              "assests/image/sale.jpg"), // Correct the path and file extension
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white,
                              spreadRadius: 2,
                              blurRadius: 2),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Categories",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomInkWell(
                            imageAssetPath: "assests/image/burger.jpg",
                            text: "Burger",
                            onTap: () {
                              setState(() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Burger_Menu();
                                }));
                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        CustomInkWell(
                            imageAssetPath: "assests/image/pizza.jpg",
                            text: "Pizza",
                            onTap: () {
                              setState(() {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Pizza_Menu();
                                }));
                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        CustomInkWell(
                            imageAssetPath: "assests/image/friess.jpg",
                            text: "Fries",
                            onTap: () {
                              setState(() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Friess_Menu();
                                }));
                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        CustomInkWell(
                            imageAssetPath: "assests/image/sandwich.jpg",
                            text: "Sandwich",
                            onTap: () {
                              setState(() {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Sandwich_Menu();
                                }));
                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        CustomInkWell(
                            imageAssetPath: "assests/image/Wrap.jpg",
                            text: "Wrap",
                            onTap: () {
                              setState(() {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Wraps_Menu();
                                }));
                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        CustomInkWell(
                          imageAssetPath: "assests/image/chicken.jpg",
                          text: "Fried Chick",
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return Fried_Chicken();
                                }));
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomInkWell(
                          imageAssetPath: "assests/image/Drinks.jpg",
                          text: "Cold Drink",
                          onTap: () {
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Drinks_Menu();
                              }));
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Deals",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomDealItem(
                            imageAssetPath: "assests/image/new.jpg",
                            title: "  Deal 1",
                            rating: "4.7(944 Ratings)",
                            price: "Rs.1500",
                            onTap: () {
                              setState(() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Burgerbill(
                                    image: 'assests/image/new.jpg',
                                    name: "Deal 1",
                                    Descr: "", price: 1500,
                                  );
                                }));
                              });
                            }),
                        SizedBox(
                          width: 20,
                        ),
                        CustomDealItem(
                            imageAssetPath: "assests/image/D2.jpg",
                            title: "  Deal 2",
                            rating: "4.3(794 Ratings)",
                            price: "Rs.990",
                            onTap: () {
                              setState(() {});
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Burgerbill(
                                  image: 'assests/image/D2.jpg',
                                  name: "Deal2 ",
                                  Descr: "", price: 990,
                                );
                              }));
                            }),
                        SizedBox(
                          width: 20,
                        ),
                        CustomDealItem(
                          imageAssetPath: "assests/image/D3.jpg",
                          title: "  Deal 3",
                          rating: "4.4(804 Ratings)",
                          price: "Rs.999",
                          onTap: () {
                            setState(() {});
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Burgerbill(
                                image: 'assests/image/D3.jpg',
                                name: "Deal 3",
                                Descr: "", price: 999,
                              );
                            }));
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomDealItem(
                          imageAssetPath: "assests/image/D4.jpg",
                          title: "  Deal 4",
                          rating: "4.8(974 Ratings)",
                          price: "Rs.1299",
                          onTap: () {
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Burgerbill(
                                  image: 'assests/image/D4.jpg',
                                  name: "Deal 4",
                                  Descr: "", price: 1299,
                                );
                              }));
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ));
  }
}
