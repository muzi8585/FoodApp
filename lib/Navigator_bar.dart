import 'package:demo/Addcart.dart';
import 'package:demo/Map.dart';
import 'package:flutter/material.dart';

import 'UI.dart';

class DEMO extends StatefulWidget {
  const DEMO({super.key});

  @override
  State<DEMO> createState() => _DEMOState();
}

class _DEMOState extends State<DEMO> {
  int _currentindex=0;
  final Color  color=Colors.black54;
  final tabs=[
    Center(child: Dashbaord(),),
    Center(child: Cart() ,),
    Center(child: MapS(),),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  tabs[_currentindex], bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      currentIndex: _currentindex,

      iconSize: 30,
      items:[
        BottomNavigationBarItem(
          label: "Home",
          backgroundColor: color,
          icon: Icon(Icons.home,),

        ),
        BottomNavigationBarItem(
          label: "Cart",
          backgroundColor: color,
          icon: Icon(Icons.shopping_cart),
        ),BottomNavigationBarItem(
          label: "Nearby",
          backgroundColor: color,
          icon: Icon(Icons.map_outlined),
        ),
      ],
      onTap: (index){
        setState(() {
          _currentindex=index;
        });
      },
    ),
    );
  }
}