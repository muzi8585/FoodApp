import 'package:flutter/material.dart';
class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(title: Text("About",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),backgroundColor: Colors.black,),
      body: Padding(
        padding: const EdgeInsets.only(left: 35,top:200),
        child: Column(
          children: [
           Text("Flutter App",style: TextStyle(color: Colors.white,fontSize: 30),),
           Text("1.0.0",style: TextStyle(color: Colors.white,fontSize: 20)),
            SizedBox(height: 20,),
            Text("@2024 Your Comapany.All rights reserved.",style: TextStyle(color: Colors.grey,fontSize:15)),
            SizedBox(height: 5,),
            Text("Powered By Flutter",style: TextStyle(color: Colors.white,fontSize: 20))
          ],
        ),
      ),
    );
  }
}

