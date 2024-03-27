

import 'package:flutter/material.dart';


class CustomListItem extends StatefulWidget {
  final String title;
  final String rating;
  final String imageAssetPath;
  final String Price;
  final VoidCallback onTap;





  CustomListItem({
    required this.title,
    required this.rating,
    required this.imageAssetPath,
    required this.onTap,
    required this.Price,

  });

  @override
  State<CustomListItem> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      subtitle: Row(
        children: [
          Icon(Icons.star_half_outlined, color: Colors.red),
          Text(
            widget.rating,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 40,
        child: Image(image: AssetImage(widget.imageAssetPath)),
      ),
      onTap: /*() {
        Fluttertoast.showToast(msg: widget.title);
        // Write data to Firebase database when tapped
        *//*_databaseReference.push().set({
          'title': widget.title,
          'imageAssetPath': widget.rating,
          'imageAssetPath': widget.imageAssetPath,
          'price': widget.Price,
          // You can add more fields as needed
        });*//*

        // Execute the original onTap function

      },*/ widget.onTap,
      trailing:  Column(
        children: [
          Text(
            "Order Now",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            widget.Price,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}