import 'package:city_weather/feature/login/data/repository/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<IAuthRepository>(
  (ref) => AuthRepository(FirebaseAuth.instance),
);

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _auth;
  AuthRepository(this._auth);

  @override
  Future<User?> signIn(String email, String password) async {
    try {
      final auth = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return auth.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}
