import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  //get firebase auth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // get user
  User? getCurrentUser(){
    return _firebaseAuth.currentUser;
  }
  //sign in
  Future<UserCredential> signIn(String email, password) async{
    try{
      //sign in
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email:email, password:password);
      return userCredential;
    }
    //catch errors
    on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }
  //register
  Future<UserCredential> register(String email, password) async{
    try{
      //register
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email:email, password:password);
      return userCredential;
    }
    //catch errors
    on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }


  //sign out
  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }


}