import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelmanagemnt/component/drawer.dart';

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  final userCollection = FirebaseFirestore.instance.collection('Students');

  Future<void> editField(String field) async {
    String newValue = '';
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Color(0xFFDCEAC1),
              title: Text(
                'Edit ${field}',
                style: TextStyle(color: Color(0xFF4E710C)),
              ),
              content: TextField(
                autofocus: true,
                style: TextStyle(color: Color(0xFF587819)),
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xFF9AC24B)),
                    hintText: "Enter new ${field}",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4E710C)))),
                onChanged: (value) {
                  newValue = value;
                },
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Color(0xFF4E710C)),
                    )),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(newValue),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Color(0xFF4E710C)),
                    ))
              ],
            ));

    if (newValue.trim().length > 0) {
      await userCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Color(0xFFEBFEDE),
          elevation: 0.0,

          title: Text(
            'Profile',
            style: TextStyle(
              color: Color(0xFF001B4A),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          //centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                gradient: LinearGradient(
                    colors: [Color(0xFF8794A5), Color(0xFF9AA3AF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
        ),
        drawer: MyDrawer(),
        backgroundColor: Color(0xFFEBFEDE),
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Students")
                .doc(currentUser.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.exists) {
                final userData = snapshot.data!.data() as Map<String, dynamic>;
                return ListView(
                  children: [
                    Icon(
                      Icons.person_2_rounded,
                      color: Color(0xFF5B7D17),
                      size: 60,
                    ),
                    Text(
                      currentUser.email!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF5B7D17)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFD0E6A5),
                          borderRadius: BorderRadius.circular(20)),
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 15, top: 15),
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Full name',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    color: Color(0xFF649602),
                                    fontWeight: FontWeight.w400),
                              ),
                              IconButton(
                                  onPressed: () => {editField('full name')},
                                  icon: Icon(Icons.settings,
                                      color: Color(0xFF649602)))
                            ],
                          ),
                          Text(userData['full name'],
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  color: Color(0xFF649602),
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFD0E6A5),
                          borderRadius: BorderRadius.circular(20)),
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 15, top: 15),
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Phone No',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    color: Color(0xFF649602),
                                    fontWeight: FontWeight.w400),
                              ),
                              IconButton(
                                  onPressed: () => {editField('phone no')},
                                  icon: Icon(Icons.settings,
                                      color: Color(0xFF649602)))
                            ],
                          ),
                          Text(userData['phone no'],
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  color: Color(0xFF649602),
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFD0E6A5),
                          borderRadius: BorderRadius.circular(20)),
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 15, top: 15),
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Reg No',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    color: Color(0xFF649602),
                                    fontWeight: FontWeight.w400),
                              ),
                              // IconButton(
                              //     onPressed: () => {editField('register no')},
                              //     icon: Icon(Icons.settings),
                              //     color: Color(0xFF649602))
                            ],
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Text(userData['register no '],
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  color: Color(0xFF649602),
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFD0E6A5),
                          borderRadius: BorderRadius.circular(20)),
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 15, top: 15),
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Room No',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    color: Color(0xFF649602),
                                    fontWeight: FontWeight.w400),
                              ),
                              // IconButton(
                              //     onPressed: () => {editField('room no')},
                              //     icon: Icon(Icons.settings),
                              //     color: Color(0xFF649602))
                            ],
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Text(userData['room no'],
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  color: Color(0xFF649602),
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFD0E6A5),
                          borderRadius: BorderRadius.circular(20)),
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 15, top: 15),
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ' Change Password',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    color: Color(0xFF649602),
                                    fontWeight: FontWeight.w400),
                              ),
                              IconButton(
                                  onPressed: () => {editField('password')},
                                  icon: Icon(
                                    Icons.settings,
                                    color: Color(0xFF649602),
                                  ))
                            ],
                          ),
                          // Text(userData['password'],
                          //     textDirection: TextDirection.ltr,
                          //     style: TextStyle(
                          //       color: Color(0xFF649602),
                          //       fontWeight: FontWeight.w500,
                          //     ))
                        ],
                      ),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error${snapshot.error} '),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
