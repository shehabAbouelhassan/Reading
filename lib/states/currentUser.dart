import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier {
  String _uid; //two states
  String _email;

  //accissive properties

  String get getUid => _uid;
  String get getEmail => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email, String password) async {
    bool retval = false;
    try {
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (_authResult.user != null) {
        retval = true;
      }
    } catch (e) {
      print(e);
    }
    return retval;
  }

  Future<bool> loginUser(String email, String password) async {
    bool retval = false;
    try {
      AuthResult _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (_authResult.user != null) {
        _uid = _authResult.user.uid; //we have a state now
        _email = _authResult.user.email;
        retval = true;
      }
    } catch (e) {
      print(e);
    }
    return retval;
  }
}
