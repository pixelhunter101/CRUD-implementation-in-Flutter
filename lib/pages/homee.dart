// ignore_for_file: prefer_const_constructors, duplicate_ignore, unused_import

import 'package:crud_app_neel/pages/List_El.dart';
import 'package:crud_app_neel/pages/add_El.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crud_app_neel/pages/login.dart';
import 'package:crud_app_neel/pages/update_el.dart';


class Home_Page extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home_Page> {


  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        backgroundColor: Color.fromARGB(235, 124, 7, 62),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text("LIST",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ), 
            ),
          ElevatedButton(
            child: Text(
              "+",
              style: TextStyle(
                fontFamily: GoogleFonts.assistant().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color.fromARGB(255, 192, 0, 0)
              ),),
            style: TextButton.styleFrom(
               // ignore: prefer_const_constructors
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // ignore: prefer_const_constructors
              minimumSize: Size(35, 35),
            ),
            onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Add_Id(),
                  ),
                )
              },
          )
          ],
        ),
    
      ),
      body: List_Id(),
        // ignore: prefer_const_constructors
        
      
      );
      
  }
}