// ignore_for_file: dead_code, prefer_const_constructors, duplicate_ignore, avoid_print

import 'package:crud_app_neel/pages/homee.dart';
import 'package:crud_app_neel/pages/login.dart';
import 'package:crud_app_neel/pages/sign-up.dart';
import 'package:crud_app_neel/pages/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  // ignore: prefer_const_constructors
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // CHeck for Errors
        if (snapshot.hasError) {
          print("Something went Wrong");
        }
        // once Completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // ignore: avoid_unnecessary_containers
            themeMode: ThemeMode.light,
            theme: ThemeData(
              primarySwatch: Colors.purple,
              fontFamily: GoogleFonts.lato().fontFamily,
              ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),


            routes: {
              Routes.loginRoute:(context) => LoginPage(),
              Routes.signupRoute:(context) => SignUp(),
              Routes.homeRoute:(context) => Home_Page(),
            },
          );

        }
        return CircularProgressIndicator();
      },
    );
  }
  }

  
 