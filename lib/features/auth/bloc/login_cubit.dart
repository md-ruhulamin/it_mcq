// login_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:it_mcq/data/repo/user_repo.dart';
import 'package:it_mcq/data/user_model.dart';

part 'login_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(LoginInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRepository _userRepository = UserRepository();

  // 🔹 Email Registration
  Future<void> registerWithEmailAndPassword({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String role,
  }) async {
    emit(RegistrationLoading());
    try {
      // Create user in Firebase Auth
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userId = credential.user!.uid;

      // Create Firestore user document
      final newUser = UserModel(
        id: userId,
        name: name,
        email: email,
        phone: phone,
        role: role,
        photoUrl: credential.user?.photoURL,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Save to Firestore via repository
      await _userRepository.addUser(newUser);

      emit(RegistrationSuccess());
    } catch (e) {
      emit(RegistrationFailure(error: e.toString()));
    }
  }

  // 🔹 Google Sign-In
  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(LoginInitial()); // user canceled
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      UserCredential userCred = await _auth.signInWithCredential(credential);
      final firebaseUser = userCred.user!;

      // Check if user exists in Firestore
      final existingUser = await _userRepository.getUser(firebaseUser.uid);

      // If new user, create document in Firestore
      if (existingUser == null) {
        final newUser = UserModel(
          id: firebaseUser.uid,
          name: firebaseUser.displayName ?? 'User',
          email: firebaseUser.email ?? '',
          phone: firebaseUser.phoneNumber ?? '',
          role: 'car_owner', // Default role
          photoUrl: firebaseUser.photoURL,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await _userRepository.addUser(newUser);
      }

      emit(LoginSuccess());
    } catch (e) {
      print("Google Login Error: $e");
      emit(LoginFailure(error: e.toString()));
    }
  }

  Future<void> loginWithEmail(String email, String password) async {
    emit(LoginLoading());
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(LogoutLoading());

    print("Called Logout function");
    try {
      await _auth.signOut();
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure(error: e.toString()));
    }
  }
}
