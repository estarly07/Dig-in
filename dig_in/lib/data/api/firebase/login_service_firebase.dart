import 'package:firebase_auth/firebase_auth.dart';

class LoginServiceFirebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
  
  
}