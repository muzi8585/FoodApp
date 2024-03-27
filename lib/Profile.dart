import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final editc=TextEditingController();
  final agec=TextEditingController();
  final addc=TextEditingController();
  final _mail=TextEditingController();
  final databaseref=FirebaseDatabase.instance.ref("Data");
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:StreamBuilder(
        stream: databaseref.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData) {
            Map<dynamic, dynamic> map =
            snapshot.data!.snapshot.value as dynamic;
            List<dynamic> list = [];
            list.clear();
            list = map.values.toList();
            // list.add(map.values.toList());
            print(list);
            return ListView.builder(
                itemCount: snapshot.data!.snapshot.children.length,
                itemBuilder: (context, index) {
                  final name = list[index]['Name'].toString();
                  showMyDialog(name, list[index]['Id'].toString(),list[index]['Age'].toString(),list[index]['Address'].toString(),list[index]['Email']);

                });
          } else {
            return Text("Loading...");
          }
        },
      ),
    );
  }
  Future<void> showMyDialog(String name, String id, String age, String address,String email) async {

    return showDialog(
      context: context,
      builder: (context) {
        editc.text = name;
        agec.text = age;
        addc.text = address;
        _mail.text=email;


        return AlertDialog(
          title: Text("Update Data"),
          content: Container(
            height: 300,
            width: 200,
            child: Column(
              children: [
                TextField(
                  controller: _mail,
                  decoration: InputDecoration(
                    hintText: "Edit Email",
                  ),
                ),
                TextField(
                  controller: editc,
                  decoration: InputDecoration(
                    hintText: "Edit Name",
                  ),
                ),
                TextField(
                  controller: agec,
                  decoration: InputDecoration(
                    hintText: "Edit Age",
                  ),
                ),
                TextField(
                  controller: addc,
                  decoration: InputDecoration(
                    hintText: "Edit Address",
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                databaseref.child(id).update({
                  'Email':_mail.text.toLowerCase(),
                  'Name': editc.text.toLowerCase(),
                  'Age': int.parse(agec.text),
                  'Address': addc.text.toLowerCase(),
                }).then((value) {
                  Fluttertoast.showToast(msg: "Update Successfully");
                }).onError((error, stackTrace) {
                  Fluttertoast.showToast(msg: "Something is wrong");
                });
              },
              child: Text("Update"),
            ),
          ],
        );
      },
    );
  }
}

