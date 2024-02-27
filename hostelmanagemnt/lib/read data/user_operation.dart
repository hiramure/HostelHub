import 'package:cloud_firestore/cloud_firestore.dart';

class UserOperations {
  static Future<void> deleteUser(String documentId) async {
    await FirebaseFirestore.instance
        .collection('Students')
        .doc(documentId)
        .delete();
  }
}
