import 'dart:io';
import 'package:demo/Model_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final editc = TextEditingController();
  final name = TextEditingController();
  final age = TextEditingController();
  final add = TextEditingController();
  final _mailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();
  final databaseref = FirebaseDatabase.instance.ref("Data");
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool obscure = true;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final formkey = GlobalKey<FormState>();
  final FirebaseStorage storage = FirebaseStorage.instance;
  List<ImageSource> imageSources = [
    ImageSource.camera,
    ImageSource.gallery,
  ];
  File? file;
  Future<void> getImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pick = await imagePicker.pickImage(source: source);
    if (pick != null) {
      setState(() {
        file = File(pick.path);
      });
    } else {
      print('Null');
    }
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    age.dispose();
    add.dispose();
    _mailcontroller.dispose();
    _passcontroller.dispose();
  }

  Future<void> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            height: 1000,
            width: 1500,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assests/image/4.jpg"),
              ),
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Form(
                key: formkey,
                child: Column(children: [
                  file != null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: FileImage(File(file!.path)),
                        )
                      : CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.white10,
                          child: Icon(Icons.person),
                        ),
                  Text(
                    'Choose Image Source:',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                  for (ImageSource source in imageSources)
                    ElevatedButton(
                      onPressed: () => getImage(source),
                      child: Text(
                        source == ImageSource.camera ? 'Camera' : 'Gallery',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black54,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.white),
                              ]),
                          child: TextFormField(
                            controller: name,
                            cursorColor: Colors.black,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Your Name";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Enter your name",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.white),
                            ],
                          ),
                          child: TextFormField(
                            controller: age,
                            cursorColor: Colors.black,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Your Age ";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Enter your Age",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.calendar_month,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.white),
                            ],
                          ),
                          child: TextFormField(
                            controller: add,
                            cursorColor: Colors.black,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Your Address ";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Enter your address",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.home,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.white),
                              ]),
                          child: TextFormField(
                            controller: _mailcontroller,
                            cursorColor: Colors.black,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter E-mail";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Enter your email",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.white),
                              ]),
                          child: TextFormField(
                            controller: _passcontroller,
                            cursorColor: Colors.black,
                            obscureText: obscure,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Password";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Enter your password",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    if (obscure) {
                                      obscure = false;
                                    } else {
                                      obscure = true;
                                    }
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.grey,
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 280,
                          child: ElevatedButton(
                            onPressed: () async {
                              signUp(_mailcontroller.text.toString(),
                                  _passcontroller.text.toString());
                              /*  if(formkey.currentState!.validate()){
                              firebaseAuth.createUserWithEmailAndPassword(email: email.text.toString(), password:pass.text.toString()).then((value){
                                Fluttertoast.showToast(msg: "User Registor Successfully");
                              }).onError((error, stackTrace) {
                                Fluttertoast.showToast(msg: "Something went wrong");
                              });
                            }*/
                              if (name.text.isEmpty ||
                                  age.text.isEmpty ||
                                  add.text.isEmpty ||
                                  _mailcontroller.text.isEmpty ||
                                  _passcontroller.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please Enter Data COmpletely");
                              } else if (file != null) {
                                String id = databaseref.push().key.toString();
                                Reference storageReference = _storage
                                    .ref()
                                    .child(
                                        'product_images/${DateTime.now()}.png');
                                UploadTask uploadTask =
                                    storageReference.putFile(file!);
                                await uploadTask.whenComplete(() async {
                                  String imageUrl =
                                      await storageReference.getDownloadURL();

                                  Model_class model = Model_class(
                                      name.text.toString(),
                                      add.text.toString(),
                                      id,
                                      age.text.toString(),
                                      _mailcontroller.text.toString(),
                                      _passcontroller.text.toString(),
                                      imageUrl);
                                  databaseref.child(id).set(model.toMap()).then((value) {
                                    Fluttertoast.showToast(
                                        msg: "Save Data Successfully");
                                    name.clear();
                                    age.clear();
                                    add.clear();
                                    _mailcontroller.clear();
                                    _passcontroller.clear();
                                  }).onError((error, stackTrace) {
                                    Fluttertoast.showToast(
                                        msg: "Something Went Wrong");
                                  });

                                  Fluttertoast.showToast(msg: imageUrl);
                                });
                              }
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black54,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}
