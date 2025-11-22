import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthGateCubit extends Cubit<User?> {
  AuthGateCubit() : super(null) {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      print("Checking");
      emit(user);
    });
  }
}