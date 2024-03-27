
import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  final String imageAssetPath;
  final String text;
  final VoidCallback onTap;

  CustomInkWell({
    required this.imageAssetPath,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      child: Container(
        height: 100,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image(
              image: AssetImage(imageAssetPath),
            ),
            Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      onTap:
        onTap,
    );
  }
}


