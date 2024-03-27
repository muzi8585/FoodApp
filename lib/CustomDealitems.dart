import 'package:flutter/material.dart';

class CustomDealItem extends StatelessWidget {
  final String imageAssetPath;
  final String title;
  final String rating;
  final String price;
  final VoidCallback onTap;

  CustomDealItem({
    required this.imageAssetPath,
    required this.title,
    required this.rating,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 210,
        width: 260,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 2,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Stack(
          children: [
            Image(
              image: AssetImage(imageAssetPath),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                  SizedBox(width: 5),
                  Text(
                    rating,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  Text(
                    price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

