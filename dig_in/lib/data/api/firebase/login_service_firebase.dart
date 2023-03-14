import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginServiceFirebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> loginByEmailAndPassword(String email, String password) async {
    try{
      print(email);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _auth.currentUser?.uid;
    } on FirebaseAuthException catch(e){
      print(e);
      throw e;
    }
  }

  Future<String?>  registerUserByEmailAndPassword(String email, String password)async {
    try{
      print(email);
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return _auth.currentUser?.uid;
    } on FirebaseAuthException catch(e){
      print(e);
      throw e;
    }
  }

  Future<bool> registerUser(Map<String, dynamic> json,String uid)async {
     try{
      print(json);
      final response =await _firestore.collection("users").doc(uid).set(json)
        .then((_) => true)
        .catchError((e){
          print(e);
          return false;
        });
      print(response);
      return response;
    } on FirebaseAuthException catch(e){
      print(e);
      throw e;
    }
  }
  
  
}