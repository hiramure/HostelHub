import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreNotices {
  // get collection of notices
  final CollectionReference notices =
      FirebaseFirestore.instance.collection('notices');

  //create a new notice
  Future<void> addNotice(String notice) {
    return notices.add({
      'note': notice,
      'timestamp': Timestamp.now(),
    });
  }

  //get notices from database
  Stream<QuerySnapshot> getNoticesStream() {
    final noticesStream =
        notices.orderBy('timestamp', descending: true).snapshots();
    return noticesStream;
  }

  //update notices
  Future<void> updateNotice(String docID, String newNotice) {
    return notices
        .doc(docID)
        .update({'note': newNotice, 'timestamp': Timestamp.now()});
  }

  //deleting notices
  Future<void> deleteNotice(String docID) {
    return notices.doc(docID).delete();
  }
}
