// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_app_neel/pages/update_el.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class List_Id extends StatefulWidget {
  List_Id({Key? key}) : super(key: key);

  @override
  _ListStudentPageState createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<List_Id> {
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('students').snapshots();

  // For Deleting User
  CollectionReference students =
      FirebaseFirestore.instance.collection('students');
  Future<void> deleteUser(id) {
    print("User Deleted $id");
    return students
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();
          
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Card(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                        height: 30,
                      ),
                          Table(
                          border: TableBorder.all(
                          ),
                          columnWidths: const <int, TableColumnWidth>{
                            1: FixedColumnWidth(140),
                          },
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 131, 29, 80),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Name',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Color.fromARGB(255, 131, 29, 80),
                                    child: Center(
                                      child: Text(
                                        'Mail',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 131, 29, 80),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Action',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            for (var i = 0; i < storedocs.length; i++) ...[
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Center(
                                        child: Text(storedocs[i]['name'],
                                            style: TextStyle(fontSize: 18.0))),
                                  ),
                                  TableCell(
                                    child: Center(
                                        child: Text(storedocs[i]['email'],
                                            style: TextStyle(fontSize: 18.0))),
                                  ),
                                  TableCell(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Update_Id(
                                                    id: storedocs[i]['id']),
                                              ),
                                            )
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Color.fromARGB(255, 244, 54, 117),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () =>
                                              {deleteUser(storedocs[i]['id'])},
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
