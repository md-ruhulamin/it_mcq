import 'package:equatable/equatable.dart';
import 'package:it_mcq/data/user_model.dart';


abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UserModel> users;
  UserLoaded(this.users);

  @override
  List<Object?> get props => [users];
}

class SingleUserLoaded extends UserState {
  final UserModel user;
  SingleUserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class UserSuccess extends UserState {}

class UserFailure extends UserState {
  final String error;
  UserFailure(this.error);

  @override
  List<Object?> get props => [error];
}
