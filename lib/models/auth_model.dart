import 'package:firebase_auth/firebase_auth.dart';

class AuthModel {
  String uid;
  String email;

  AuthModel({
    this.uid,
    this.email,
  });

  AuthModel.fromFirebaseUser({FirebaseUser user}) {
    //named constructor
    uid = user.uid;
    email = user.email;
  }
}
