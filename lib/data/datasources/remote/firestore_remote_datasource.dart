import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRemoteDataSource {
  final FirebaseFirestore firestore;

  FirestoreRemoteDataSource(this.firestore);

  Future<void> upsert({required String collection, required String docId, required Map<String, dynamic> payload}) async {
    await firestore.collection(collection).doc(docId).set(payload, SetOptions(merge: true));
  }
}
