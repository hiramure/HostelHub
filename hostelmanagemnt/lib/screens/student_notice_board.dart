import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostelmanagemnt/component/drawer.dart';

class StudentNoticeBoard extends StatefulWidget {
  const StudentNoticeBoard({super.key});

  @override
  State<StudentNoticeBoard> createState() => _StudentNoticeBoardState();
}

class _StudentNoticeBoardState extends State<StudentNoticeBoard> {
  // notice IDs
  List<Map<String, dynamic>> noticeData = [];

  //get IDs
  Future getNoticeData() async {
    noticeData.clear();
    await FirebaseFirestore.instance
        .collection('notices')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              noticeData.add({
                'note': data['note'] ?? '',
                'timestamp': data['timestamp']?.toDate() ?? '',
              });
            }));
  }

  // @override
  // void initState() {
  //   getNoticeId();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Color(0xFFEBFEDE),
          elevation: 0.0,

          title: Text(
            'N O T I C E S',
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
        body: Container(
          //decoration: BoxDecoration(color: Color(0xFFEBFEDE)),
          child: Column(
            children: [
              Expanded(
                  child: FutureBuilder(
                future: getNoticeData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return ListView.builder(
                        itemCount: noticeData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              tileColor: Color(0xFFD0E6A5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              titleTextStyle: TextStyle(
                                  color: Color(0xFF649602),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              subtitleTextStyle:
                                  TextStyle(color: Color(0xFF649602)),
                              title: Text('${noticeData[index]['note']}'),
                              subtitle:
                                  Text('${noticeData[index]['timestamp']}'),
                            ),
                          );
                        });
                  }
                },
              ))
            ],
          ),
        ));
  }
}
