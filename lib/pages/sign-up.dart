import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crud_app_neel/pages/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String usernameError = "", passwordError = "", cnf = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      // ignore: prefer_const_constructors
      child: SingleChildScrollView(
        child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 210,
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 55,
              ),
              // ignore: prefer_const_constructors
              Text(
                "Create User :)",
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 114, 113, 113),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 8,
              ),
              // ignore: prefer_const_constructors
              Text(
                "Enter Credentials",
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              Padding(
                // ignore: prefer_const_constructors
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 100),
                child: Column(children: [
                  TextField(
                    controller: username,
                    decoration: InputDecoration(
                      // ignore: prefer_const_constructors
                      border: OutlineInputBorder(),
                      filled: true,
                      // ignore: unnecessary_new
                      hintStyle: new TextStyle(color: Colors.grey[600]),
                      hintText: "Usenamess: ",
                      fillColor: Colors.white,
                      labelText: "Create Username",
                    ),
                  ),
                  Text(
                    usernameError,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      // ignore: prefer_const_constructors
                      border: OutlineInputBorder(),
                      filled: true,
                      // ignore: unnecessary_new
                      hintStyle: new TextStyle(color: Colors.grey[600]),
                      hintText: "Enter Password: ******",
                      fillColor: Colors.white,
                      labelText: "Create Password",
                    ),
                  ),
                  Text(
                    passwordError,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: confirmPassword,
                    decoration: InputDecoration(
                      // ignore: prefer_const_constructors
                      border: OutlineInputBorder(),
                      filled: true,
                      // ignore: unnecessary_new
                      hintStyle: new TextStyle(color: Colors.grey[600]),
                      hintText: "******",
                      // ignore: prefer_const_constructors
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      labelText: "Confirm Password",
                    ),
                  ),
                  Text(
                    cnf,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 70,
                  ),
                  ElevatedButton(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: GoogleFonts.assistant().fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      // ignore: prefer_const_constructors
                      backgroundColor: Color.fromARGB(255, 177, 31, 92),
                      // ignore: prefer_const_constructors
                      minimumSize: Size(150, 60),
                    ),
                    onPressed: () {
                      if (username.text.isEmpty) {
                        setState(() {
                          usernameError = "Username Required";
                        });
                      } else {
                        setState(() {
                          usernameError = "";
                        });
                      }
                      if (password.text.isEmpty) {
                        setState(() {
                          passwordError = "Password Required";
                        });
                      } else {
                        setState(() {
                          passwordError = "";
                        });
                      }
                      if (password.text.isEmpty) {
                        setState(() {
                          cnf = "Confirm Password Required";
                        });
                      } else {
                        setState(() {
                          cnf = "";
                        });
                      }
                      if (password.text != confirmPassword.text) {
                        setState(() {
                          cnf = "";
                          cnf = "Passwords should be same";
                        });
                      }
                      if (username.text.isNotEmpty &&
                          password.text.isNotEmpty &&
                          confirmPassword.text.isNotEmpty &&
                          password.text == confirmPassword.text) {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: username.text, password: password.text)
                            .then((value) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        });
                      }
                      // Navigator.pushNamed(context, Routes.loginRoute);
                    },
                  ),
                ]),
              ),
            ]),
      ),
    );
  }
}
