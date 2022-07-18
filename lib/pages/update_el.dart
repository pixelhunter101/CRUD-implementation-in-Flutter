// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Update_Id extends StatefulWidget {
  final String id;
  Update_Id({Key? key, required this.id}) : super(key: key);

  @override
  _UpdateStudentPageState createState() => _UpdateStudentPageState();
}

class _UpdateStudentPageState extends State<Update_Id> {
  final _formKey = GlobalKey<FormState>();

  // Updaing Student
  CollectionReference students =
      FirebaseFirestore.instance.collection('students');

  Future<void> updateUser(id, name, email, password) {
    return students
        .doc(id)
        .update({'name': name, 'email': email, 'password': password})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 196, 22, 89),
        title: Text(
          "Update Id",
          style: TextStyle(
            fontSize: 30,
            fontFamily: GoogleFonts.abel().fontFamily,
            fontWeight: FontWeight.bold,
          ),),
      ),
      body: Form(
          key: _formKey,
          // Getting Specific Data by ID
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('students')
                .doc(widget.id)
                .get(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                print('Something Went Wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapshot.data!.data();
              var name = data!['name'];
              var email = data['email'];
              var password = data['password'];
              
              return Padding(
                
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  
                  child: ListView(
                    children: [
                      
                      Text("Update Id",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 133, 76, 111),
                      ),),
                      SizedBox(
                  height: 50,
                ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          initialValue: name,
                          autofocus: false,
                          onChanged: (value) => name = value,
                          decoration: InputDecoration(
                            labelText: 'Name: ',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(
                            ),
                            errorStyle:
                                TextStyle(color: Colors.redAccent, fontSize: 15),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Name';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          initialValue: email,
                          autofocus: false,
                          onChanged: (value) => email = value,
                          decoration: InputDecoration(
                            labelText: 'Email: ',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(
                            ),
                            errorStyle:
                                TextStyle(color: Colors.redAccent, fontSize: 15),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            } else if (!value.contains('@')) {
                              return 'Please Enter Valid Email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          initialValue: password,
                          autofocus: false,
                          onChanged: (value) => password = value,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password: ',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(
                            ),
                            errorStyle:
                                TextStyle(color: Colors.redAccent, fontSize: 15),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          

                            ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, otherwise false.
                                if (_formKey.currentState!.validate()) {
                                  updateUser(widget.id, name, email, password);
                                  Navigator.pop(context);
                                }
                              },
                              child: Text(
                                '+',
                                style: TextStyle(fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                                
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 199, 35, 103),
                                minimumSize: Size(120, 50),
              
                                ),
                            ),
                            ElevatedButton(
                              onPressed: () => {},
                              child: Text(
                                'Reset',
                              
                                style: TextStyle(fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 92, 20, 56),
                                minimumSize: Size(120, 50),
              
                                ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
