import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final _database = FirebaseDatabase.instance.ref("Cart Items");

  void deleteOrder(String orderId) {
    DatabaseReference orderRef = _database.child(orderId);

    orderRef.remove().then((_) {
      Fluttertoast.showToast(msg: "Order deleted successfully");
    }).catchError((error) {
      Fluttertoast.showToast(msg: "Failed to delete order: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Cart",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          StreamBuilder(
            stream: _database.onValue,
            builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
              if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
                Map<dynamic, dynamic> map =
                    snapshot.data!.snapshot.value as dynamic;

                List<dynamic> cartItems = map.values.toList();

                return ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(
                          cartItems[index]['Name'].toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        subtitle: Text(
                          cartItems[index]['Descr'].toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: CircleAvatar(
                          radius: 50,
                          child: Image(
                              image: AssetImage(
                                  cartItems[index]['Image'].toString())),
                        ),
                        trailing: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20, top: 8),
                              child: Column(
                                children: [
                                  Text(
                                    "Qty:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                  Text(
                                    cartItems[index]['Quantity'].toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: PopupMenuButton(
                                  child: Icon(
                                    Icons.more_vert,
                                    color: Colors.grey,
                                  ),
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        value: 1,
                                        onTap: () {
                                          deleteOrder(cartItems[index]['id']
                                              .toString());
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.grey,
                                        ),
                                      )
                                    ];
                                  }),
                            )
                          ],
                        ));
                  },
                );
              } else {
                return Center(
                    child: Text(
                  "Error: ${snapshot.error}",
                  style: TextStyle(color: Colors.white),
                ));
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 525, left: 35),
            child: Container(
              width: 280,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text(
                  "Order Now",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
