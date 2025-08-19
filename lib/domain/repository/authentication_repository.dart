import 'package:firebase_auth/firebase_auth.dart';
import 'package:reservate/data/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> logout();

  Stream<User?> get authStateChanges;

  User? getCurrentUser();
}
