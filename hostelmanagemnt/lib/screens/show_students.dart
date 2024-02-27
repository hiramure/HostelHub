import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostelmanagemnt/read%20data/show_student_detail.dart';
import 'package:hostelmanagemnt/screens/student_update.dart';

import '../read data/user_operation.dart';

class ShowStudents extends StatefulWidget {
  const ShowStudents({super.key});

  @override
  State<ShowStudents> createState() => _ShowStudentsState();
}

class _ShowStudentsState extends State<ShowStudents> {
  List<String> docIDs = [];

  Future<void> deleteUser(String documentId) async {
    bool confirmDeletion = await _showDeleteConfirmationDialog();

    if (confirmDeletion) {
      await UserOperations.deleteUser(documentId);
      // After deleting, refresh the UI
      await getDocId();
      setState(() {});
    }
  }

  Future<bool> _showDeleteConfirmationDialog() async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Confirm Deletion'),
              content: Text('Are you sure you want to delete this student?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // Don't delete
                  },
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true); // Confirm deletion
                  },
                  child: Text('Yes'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  Future getDocId() async {
    docIDs.clear();
    await FirebaseFirestore.instance
        .collection('Students')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              if (data.containsKey('email')) {
                if (document['email'] != 'admin@gmail.com') {
                  print(document.reference);
                  docIDs.add(document.reference.id);
                }
              }
            }));
  }
  //
  // @override
  // void initState() {
  //   getDocId();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Color(0xFFEBFEDE),
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
              icon: Icon(Icons.search))
        ],
        title: Text(
          'Students',
          style: TextStyle(
            color: Color(0xFF001B4A),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        //centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              gradient: LinearGradient(colors: [
                Color(0xFFCB83D8),
                Color(0xFFE4C3EA),
                Color(0xFFF0E5F2)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
      ),
      backgroundColor: Color(0xFFEBFEDE),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentUpdate(
                                  studentID: docIDs[index],
                                  // Pass the entire list of docIDs
                                ),
                              ),
                            );
                          },
                          title: GetStudentDetails(
                            documentId: docIDs[index],
                          ),
                          tileColor: Color(0xFFD0E6A5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          titleTextStyle:
                              TextStyle(color: Color(0xFF649602), fontSize: 18),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    deleteUser(docIDs[index]);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color(0xFF6E9A18),
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addUser');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
