// ignore_for_file: prefer_const_constructors

import 'package:crud_app_neel/pages/homee.dart';
import 'package:crud_app_neel/pages/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  String usernameErr = "";
  String passwordErr = "";

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 210,
          ),
          SizedBox(
            height: 0.5,
          ),
          Text(
            "Hello ",
            style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 0, 0)),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 50),
            child: Column(
              children: [
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    // ignore: unnecessary_new
                    hintStyle: new TextStyle(color: Colors.grey[600]),
                    hintText: "Enter Mail-Id",
                    labelText: "Username:",
                  ),
                ),
                Text(
                  usernameErr,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    // ignore: unnecessary_new
                    hintStyle: new TextStyle(color: Colors.grey[600]),
                    hintText: "Enter Password - ****",
                    labelText: "Password:",
                  ),
                ),
                Text(
                  passwordErr,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                ElevatedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: GoogleFonts.assistant().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(235, 204, 46, 138),
                    minimumSize: Size(170, 60),
                  ),
                  onPressed: () {
                    if (username.text.isEmpty) {
                      setState(() {
                        usernameErr = "Enter Valid Email";
                      });
                    } else {
                      setState(() {
                        usernameErr = "";
                      });
                    }
                    if (password.text.isEmpty) {
                      setState(() {
                        passwordErr = "Entry Required";
                      });
                    } else {
                      setState(() {
                        passwordErr = "";
                      });
                    }
                    if (username.text.isNotEmpty && password.text.isNotEmpty) {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: username.text, password: password.text)
                          .then((value) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Home_Page()));
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 10,
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
                    backgroundColor: Color.fromARGB(255, 102, 5, 65),
                    minimumSize: Size(170, 60),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signupRoute);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
