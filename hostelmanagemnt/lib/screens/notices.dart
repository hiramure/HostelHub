import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostelmanagemnt/services/firestore_notices.dart';

class Notice extends StatefulWidget {
  const Notice({super.key});

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  // notice instance
  final FirestoreNotices firestoreService = FirestoreNotices();

  final TextEditingController textController = TextEditingController();

  void openNoticeBox({String? docID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              //input notices
              content: TextField(
                controller: textController,
              ),
              actions: [
                //save notices
                ElevatedButton(
                  onPressed: () {
                    if (docID == null) {
                      firestoreService.addNotice(textController.text);
                    } else {
                      firestoreService.updateNotice(docID, textController.text);
                    }

                    //clear after save
                    textController.clear();
                    //close popup
                    Navigator.pop(context);
                  },
                  child: Text('Add'),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFFEBFEDE),
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
          'Notices',
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
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: firestoreService.getNoticesStream(),
          builder: (context, snapshot) {
            //if we have data, get all
            if (snapshot.hasData) {
              List noticesList = snapshot.data!.docs;

              //display as a list
              return ListView.builder(
                  itemCount: noticesList.length,
                  itemBuilder: (context, index) {
                    //get each individual doc
                    DocumentSnapshot document = noticesList[index];
                    String docID = document.id;

                    //get notice from each doc
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    String noticeText = data['note'];

                    //dispaly as a list tile
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(noticeText),
                        tileColor: Color(0xFFD0E6A5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        titleTextStyle:
                            TextStyle(color: Color(0xFF649602), fontSize: 18),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () => openNoticeBox(docID: docID),
                                icon: const Icon(Icons.settings),
                                color: Color(0xFF6E9A18)),
                            // IconButton(
                            //     onPressed: () =>
                            //         firestoreService.deleteNotice(docID),
                            //     icon: const Icon(Icons.delete),
                            //     color: Color(0xFF6E9A18)),
                            IconButton(
                              onPressed: () {
                                // Show confirmation dialog
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Confirmation'),
                                    content:
                                        Text('Want to delete this notice?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          // Dismiss the dialog
                                          Navigator.pop(context);
                                        },
                                        child: Text('No'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Delete the notice and dismiss the dialog
                                          firestoreService.deleteNotice(docID);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Yes'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(Icons.delete),
                              color: Color(0xFF6E9A18),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
            //if there is no data return nothing
            else {
              return const Text('No notices...');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoticeBox,
        child: const Icon(Icons.add),
      ),
    );
  }
}
