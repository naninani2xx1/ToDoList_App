import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CloudFirebaseBase {
  CloudFirebaseBase(this.collection) {
    _db = _firestore.collection(collection);
  }

  late CollectionReference _db;

  final String collection;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DocumentReference<Object?>> addCollection(
      Map<String, dynamic> data) async {
    return await _db.add(data);
  }

  void update(String documentId, Map<String, dynamic> data) {
    _db.doc(documentId).update(data);
  }

  void delete(String documentId) {
    _db.doc(documentId).delete();
  }
}
