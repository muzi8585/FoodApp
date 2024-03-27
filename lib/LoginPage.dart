import 'package:demo/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Navigator_bar.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _mailcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final _passcontroller = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool obscure = true;

  @override
  void dispose() {
    super.dispose();
    _mailcontroller.dispose();
    _passcontroller.dispose();
  }

  Future<void> login() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DEMO()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.indigo,
          body: SingleChildScrollView(
            child: Container(
              height: 1000,
              width: 1500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assests/image/4.jpg"),
                ),
              ),
              child: Column(
                children: [
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: CircleAvatar(
                                      radius: 12,
                                      foregroundColor: Colors.red,
                                      backgroundColor: Colors.indigo,
                                      child: Icon(
                                        Icons.help,
                                        color: Colors.white,
                                      ),
                                    )),
                              ],
                            ),
                            Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                "Email",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
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
                              cursorColor: Colors.indigo,
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
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                "Password",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
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
                              cursorColor: Colors.indigo,
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
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                          ],
                        ),
                        Container(
                          width: 280,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                login();
                              });
                            },
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black54,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              Text(
                                "-OR-",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Sign up with",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Colors.indigo,
                                  size: 40,
                                ),
                                backgroundColor: Colors.white,
                                radius: 30.0,
                              ),
                              onTap: () {
                                setState(() {});
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.indigo,
                                  size: 40,
                                ),
                                backgroundColor: Colors.white,
                                radius: 30.0,
                              ),
                              onTap: () {
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an Account?",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SignUp();
                                  }));
                                },
                                child: Text("SignUp")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
