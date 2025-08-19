import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:reservate/data/models/user_model.dart';
import 'package:reservate/data/repository/authentication_repository_impl.dart';
import 'package:reservate/domain/repository/authentication_repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  final AuthRepository _authRepository = AuthRepositoryImpl();

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(AuthenticationLoading());

    try {
      final user = await _authRepository.signInWithEmailAndPassword(
          email: email, password: password);

      emit(AuthenticationSuccess(user: user));
    } catch (e) {
      emit(
          AuthenticationError("An unexpected error occurred: ${e.toString()}"));
    }
  }

  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(AuthenticationLoading());

    try {
      final user = await _authRepository.signUpWithEmailAndPassword(
          email: email, password: password);

      emit(AuthenticationSuccess(user: user));
    } catch (e) {
      emit(
          AuthenticationError("An unexpected error occurred: ${e.toString()}"));
    }
  }

  Future<void> logout() async {
    try {
      await _authRepository.logout();
      emit(AuthenticationLoggedOut());
    } catch (e) {
      emit(AuthenticationError("Logout failed: ${e.toString()}"));
    }
  }
}
