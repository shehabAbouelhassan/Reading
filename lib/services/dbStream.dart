import 'package:Reading_Corner/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Reading_Corner/models/groupModel.dart';

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

  Stream<GroupModel> getCurrentGroup(String groupId) {
    return _firestore.collection('users').document(groupId).snapshots().map(
          (docSnapshot) => GroupModel.fromDocumentSnapshot(doc: docSnapshot),
        );
  }
}
