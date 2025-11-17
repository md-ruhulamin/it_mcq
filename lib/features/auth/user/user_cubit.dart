import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_mcq/data/repo/user_repo.dart';
import 'package:it_mcq/data/user_model.dart';
import 'package:it_mcq/features/auth/user/user_state.dart';


class UserCubit extends Cubit<UserState> {
  final UserRepository _repository;

  UserCubit(this._repository) : super(UserInitial());

  // 🔹 Add user
  Future<void> addUser(UserModel user) async {
    emit(UserLoading());
    try {
      await _repository.addUser(user);
      emit(UserSuccess());
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }

  // 🔹 Load all users (stream)
  void loadUsers() {
    emit(UserLoading());
    try {
      _repository.loadAllUsers().listen((users) {
        emit(UserLoaded(users));
      });
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }

  // 🔹 Get single user
  Future<void> getUser(String userId) async {
    emit(UserLoading());
    try {
      final user = await _repository.getUser(userId);
      if (user != null) emit(SingleUserLoaded(user));
      else emit(UserFailure("User not found"));
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }

  // 🔹 Update user
  Future<void> updateUser(UserModel user) async {
    emit(UserLoading());
    try {
      await _repository.updateUser(user);
      emit(UserSuccess());
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }

  // 🔹 Delete user
  Future<void> deleteUser(String userId) async {
    emit(UserLoading());
    try {
      await _repository.deleteUser(userId);
      emit(UserSuccess());
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }
}
