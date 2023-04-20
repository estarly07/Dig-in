import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dig_in/log.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginServiceFirebase {
  final _tag = "LoginServiceFirebase";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> loginByEmailAndPassword(String email, String password) async {
    try{
      Log.i(_tag,email);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _auth.currentUser?.uid;
    } on FirebaseAuthException catch(e){
      Log.e(_tag,"$e");
      throw e;
    }
  }

  Future<String?>  registerUserByEmailAndPassword(String email, String password)async {
    try{
      Log.i(_tag,email);
      print(email);
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Log.i(_tag,"${_auth.currentUser?.uid}");
      return _auth.currentUser?.uid;
    } on FirebaseAuthException catch(e){
      Log.e(_tag,"$e");
      throw e;
    }
  }

  Future<bool> registerUser(Map<String, dynamic> json,String uid)async {
     try{
      Log.i(_tag,"$json");
      final response =await _firestore.collection("users").doc(uid).set(json)
        .then((_) => true)
        .catchError((e){
          print(e);
          return false;
        });
      Log.i(_tag,"$response");
      return response;
    } on FirebaseAuthException catch(e){
      Log.e(_tag,"$e");
      throw e;
    }
  }

  Future<Map<String, dynamic>?> getUser(String uid) async {
     try{
      Log.i(_tag,"$uid");
      final response =await _firestore.collection("users").doc(uid).get();
      Log.i(_tag,"${response.data()}");
      return response.data();
    } on FirebaseAuthException catch(e){
      Log.e(_tag,"$e");
      throw e;
    }
  }

  Future<User?> loginByGoogle() async {
    try{
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await _auth.signInWithCredential(credential);
        Log.i(_tag,"${_auth.currentUser?.uid}");
        return _auth.currentUser;
      }
      return null;
    } on FirebaseAuthException catch(e){
      Log.e(_tag,"$e");
      throw e;
    }
  }
  
}