import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class DrawerItem {
  final int id;
  final String name;

  DrawerItem({required this.id, required this.name});
}



class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late Future<List<DrawerItem>> _drawerData;

  @override
  void initState() {
    super.initState();
    _drawerData = fetchData();
  }

  Future<List<DrawerItem>> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => DrawerItem(id: item['id'], name: item['title'])).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<List<DrawerItem>>(
        future: _drawerData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final drawerItems = snapshot.data!;
            return ListView(
              children: drawerItems.map((item) => ListTile(title: Text(item.name))).toList(),
            );
          }
        },
      ),
    );
  }
}
