import 'package:Reading_Corner/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<AuthModel> get user {
    return _auth.onAuthStateChanged.map(
      (FirebaseUser firebaseUser) => (firebaseUser != null)
          ? AuthModel.fromFirebaseUser(user: firebaseUser)
          : null,
    );
  }

  Future<String> signOut() async {
    String retVal = "error";

    try {
      await _auth.signOut();
      //new empty instance of that
      retVal = "success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> signUpUser(
      String email, String password, String fullName) async {
    String retval = "error";

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      //  String _returnString = await OurDatabase().creatUser(_user);
      //if (_returnString == "success") {
      //retval = "success";
      // }
      retval = "success";
    } on PlatformException catch (e) {
      //poping up a message the user already have an accout
      retval = e.message;
    } catch (e) {
      print(e); //catching and print to console
    }
    return retval;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String retval = "error";

    try {
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      {
        //  String _returnString = await OurDatabase().creatUser(_user);
        //if (_returnString == "success") {
        //retval = "success";
        // }
      }
    } on PlatformException catch (e) {
      retval = e.message;
    } catch (e) {
      print(e);
    }
    return retval;
  }

  Future<String> loginUserWithGoogle() async {
    String retval = "error";

    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    try {
      //signs you into google account/passing it and whatever
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      //create a google account onfirebase for you
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
      AuthResult _authResult = await _auth.signInWithCredential(credential);

      if (_authResult.additionalUserInfo.isNewUser) {}

      //  _currentUser = await OurDatabase().getUserInfo(_authResult.user.uid);
      //if (_currentUser != null) {
      //retval = "success";
      // }

    } on PlatformException catch (e) {
      retval = e.message;
    } catch (e) {
      print(e);
    }
    return retval;
  }
}
