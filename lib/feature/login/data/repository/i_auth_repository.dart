import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<User?> signIn(String email, String password);
  Future<void> signOut();
  Stream<User?> userChanged();
}