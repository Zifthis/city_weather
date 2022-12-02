import 'package:city_weather/common/domain/error_handling/auth_exceptions.dart';
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
        throw AuthException('User not found');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Wrong password');
      } else {
        throw AuthException('An error occurred. Please try again later');
      }
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Stream<User?> userChanged() {
    final token = _auth.idTokenChanges();
    return token;
  }
}
