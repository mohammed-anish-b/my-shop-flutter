import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static AuthService _instance;

  static AuthService get getInstance {
    if (_instance == null) {
      _instance = AuthService();
    }
    return _instance;
  }

  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(result);
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {}
  }
}
