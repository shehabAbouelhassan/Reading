import 'package:Reading_Corner/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DBStream {
  Firestore _firestore = Firestore.instance;

  /// Get a stream of a single document
  Stream<UserModel> getCurrentUser(String uid) {
    return _firestore
        .collection('users')
        .document(uid)
        .snapshots()
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(doc: docSnapshot));
  }
}
