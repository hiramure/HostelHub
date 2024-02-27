import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              'H o s t e l H u b ',
              style: TextStyle(
                color: Color(0xFF523685),
                fontSize: 25,
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
                      colors: [Color(0xFFC5B2CE), Color(0xFFC2DAFD)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, '/welcome');
                },
                icon: Icon(Icons.exit_to_app_rounded),
                color: Color(0xFF523685),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(color: Color(0xFFDBEAFF)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Center(
                          child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF83749E),
                            borderRadius: BorderRadius.circular(40)),
                        margin: EdgeInsets.all(10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image(
                              image: AssetImage(
                                  'assets/images/student_manage3.jpeg'),
                              height: 200,
                              width: 180,
                            ),
                            InkWell(
                              onTap: () {
                                // Handle button press
                                Navigator.pushNamed(context, '/allStudent');
                              },
                              child: Container(
                                //padding: EdgeInsets.all(3),
                                alignment: Alignment.centerLeft,

                                child: Text(
                                  'Manage Students',
                                  style: TextStyle(
                                    color: Color(
                                        0xFFF1EBF4), // Change the text color
                                    fontSize: 20.0, // Change the font size
                                    fontWeight: FontWeight
                                        .w500, // Change the font weight
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                      SizedBox(
                        height: 19,
                      ),
                      Center(
                          child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF83749E),
                            borderRadius: BorderRadius.circular(40)),
                        margin: EdgeInsets.all(10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image(
                              image:
                                  AssetImage('assets/images/anouncement.jpeg'),
                              height: 200,
                              width: 200,
                            ),
                            InkWell(
                              onTap: () {
                                // Handle button press
                                Navigator.pushNamed(context, '/notice');
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment
                                    .center, // Adjust the alignment here
                                child: Text(
                                  'Notices',
                                  style: TextStyle(
                                    color: Color(
                                        0xFFF1EBF4), // Change the text color
                                    fontSize: 20.0, // Change the font size
                                    fontWeight: FontWeight
                                        .w500, // Change the font weight
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
