import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static AuthService _instance;
  FirebaseUser fireBaseuser;

  static AuthService get getInstance {
    if (_instance == null) {
      _instance = AuthService();
    }
    return _instance;
  }

  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

  getUser() {
    user.forEach((element) {
      fireBaseuser = element;
      print('0 $fireBaseuser');
    });
  }

  FirebaseUser get userAsList {
    FirebaseUser user;
    _auth.onAuthStateChanged.toList().then((value) => user =value[0]);
    return user;
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result;
    } catch (e) {
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
          await getUser();
      return result;
    } catch (e) {
      return null;
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {}
  }
}
