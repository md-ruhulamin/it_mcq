import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:it_mcq/core/router/app_navigator.dart';
import 'package:it_mcq/features/auth/auth_gate/auth_gate_cubit.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthGateCubit, User?>(
      builder: (context, user) {
        if (user != null) {
          Future.microtask(() => AppNavigator.goToDashBoard(context));
        } else {
          Future.microtask(() => AppNavigator.goToSplash(context));
        }
        return const SizedBox();
      },
    );
  }
}
