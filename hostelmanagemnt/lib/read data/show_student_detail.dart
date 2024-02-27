import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetStudentDetails extends StatelessWidget {
  final String documentId;
  GetStudentDetails({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference students =
        FirebaseFirestore.instance.collection('Students');

    return FutureBuilder<DocumentSnapshot>(
      future: students.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          if (data.containsKey('email')) {
            if (data['email'] == 'admin@gmail.com') {
              return SizedBox.shrink();
            }
          }

          return Text(' ${data['register no ']}');
        }
        return Text('Loading..');
      }),
    );
  }
}
