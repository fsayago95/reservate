import 'package:firebase_auth/firebase_auth.dart';
import 'package:reservate/data/datasources/auth_remote_datasources.dart';
import 'package:reservate/data/models/user_model.dart';
import 'package:reservate/domain/repository/authentication_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource = AuthRemoteDataSourceImpl();

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await remoteDataSource.signIn(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await remoteDataSource.signUp(email: email, password: password);
  }

  @override
  Future<void> logout() async {
    return await remoteDataSource.logout();
  }

  @override
  Stream<User?> get authStateChanges => throw UnimplementedError();

  @override
  User? getCurrentUser() {
    throw UnimplementedError();
  }
}
