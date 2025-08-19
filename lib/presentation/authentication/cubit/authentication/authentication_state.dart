part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationLoggedOut extends AuthenticationState {}

final class AuthenticationSuccess extends AuthenticationState {
  final UserModel user;
  AuthenticationSuccess({required this.user});
}

final class AuthenticationError extends AuthenticationState {
  final String error;
  AuthenticationError(this.error);
}
