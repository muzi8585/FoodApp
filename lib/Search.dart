import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchfilter=TextEditingController();
  final DatabaseReference databaseReference=FirebaseDatabase.instance.ref().child("Items");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: searchfilter,
                decoration: InputDecoration(
                  hintText: 'Search ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
                onChanged: (String value) {
                  setState(() {});
                },
              ),
            ),
          ),
          Expanded(
            flex: 7,
            // child: FirebaseAnimatedList(
            //   query: databaseref,
            //   itemBuilder: (context,snapshot,animation,index){
            //     return ListTile(
            //       title: Text(snapshot.child("Name").value.toString()),
            //       subtitle: Text(snapshot.child("Id").value.toString()),
            //     );
            //   },
            // ),

            child: StreamBuilder(
              stream: databaseReference.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (snapshot.hasData) {
                  Map<dynamic, dynamic> map =
                  snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list = [];
                  list.clear();
                  list = map.values.toList();
                  print(list);
                  return ListView.builder(
                      itemCount: snapshot.data!.snapshot.children.length,
                      itemBuilder: (context, index) {
                        final name = list[index]['title'].toString();
                        final imageUrl =
                        list[index]['imageAssetPath'].toString();
                        final ratin=list[index]['rating'].toString();
                        if (searchfilter.text.isEmpty ||
                            name.toLowerCase().contains(searchfilter.text
                                .toLowerCase()
                                .toLowerCase())) {
                          return ListTile(
                            title:CircleAvatar(

                              radius: 40,
                              child: Image(image: NetworkImage(imageUrl)),
                            ),
                            subtitle: Text("$ratin"),

                            /*trailing: PopupMenuButton(
                              icon: Icon(Icons.more_vert),
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                      value: 1,
                                      onTap: () {
                                        Navigator.pop(context);
                                        showMyDialog(name, list[index]['Id'].toString(),list[index]['Age'].toString(),list[index]['Address'].toString());
                                      },
                                      child: ListTile(
                                        leading: Icon(Icons.edit),
                                        title: Text("Edit"),
                                      ))
                                ];
                              },
                            ),*/
                          );
                        } else {
                          return Container();
                        }
                      });
                } else {
                  return Text("Loading...");
                }
              },
            ),
          ),
        ],
      )
    );
  }
}
