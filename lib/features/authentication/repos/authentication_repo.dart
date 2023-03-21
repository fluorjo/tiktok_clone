import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isLoggedIn => user != null;
  User? get user => _firebaseAuth.currentUser;

//파이어베이스 호출
  Future<void> signUp(String email, String password) async{
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}

final authRepo = Provider(
  (ref) => AuthenticationRepository(),
);
