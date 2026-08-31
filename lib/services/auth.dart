import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:brew_crew/models/user.dart';

class AuthService{

  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  //create user obj based on Firebase auth User
  User? _userFromFirebaseUser(auth.User? user){
    return user != null ? User(uid: user.uid) : null;
  }
  //sign in anon
  Future signInAnon() async{
    try {
      auth.UserCredential result = await _auth.signInAnonymously();
      auth.User? user = result.user;
      return _userFromFirebaseUser(user); 
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // auth change user stream
  Stream<User?> get user {
    return _auth.authStateChanges()
      //.map((auth.User? user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }

 //sign in with email & pass


 //register with email & pass


 //sign out

}