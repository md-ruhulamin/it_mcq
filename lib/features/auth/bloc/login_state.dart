// login_state.dart
part of 'login_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}
//Login
class LoginInitial extends AuthenticationState {}

class LoginLoading extends AuthenticationState {}

class LoginSuccess extends AuthenticationState {}

class LoginFailure extends AuthenticationState {
  final String error;
  const LoginFailure({required this.error});

  @override
  List<Object?> get props => [error];
}


//Registration

class RegistrationLoading extends AuthenticationState {}

class RegistrationSuccess extends AuthenticationState {}

class RegistrationFailure extends AuthenticationState {
  final String error;
  const RegistrationFailure({required this.error});

  @override
  List<Object?> get props => [error];
}

//Logout


class LogoutLoading extends AuthenticationState {}

class LogoutSuccess extends AuthenticationState {}

class LogoutFailure extends AuthenticationState {
  final String error;
  const LogoutFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
