
import 'dart:async';

import 'package:demo/LoginPage.dart';
import 'package:demo/Navigator_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
  const   Splash_Screen({Key? key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      auth(); // Call the auth method directly
    });
  }

  void auth() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return Login();
        }));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return DEMO();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(image: AssetImage("assests/image/logo.jpg"),)
      ),
    );
  }
}
