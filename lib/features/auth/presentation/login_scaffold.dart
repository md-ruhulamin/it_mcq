import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:it_mcq/core/router/app_navigator.dart';
import 'package:it_mcq/core/router/routes_name.dart';
import 'package:it_mcq/core/widgets/loading_dialog.dart';
import 'package:it_mcq/features/auth/bloc/login_cubit.dart';
import 'package:it_mcq/features/quiz/custom_text.dart';
import 'package:it_mcq/utility/constants.dart';
import 'package:it_mcq/utility/widgets/widgets.dart';

class LoginScaffold extends StatelessWidget {
  const LoginScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // Use SafeArea + Centered narrow column to emulate phone card inside rounded screen
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 18,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: _LoginCard(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginCard extends StatefulWidget {
  @override
  State<_LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<_LoginCard> {
  final TextEditingController _emailController = TextEditingController(
    text: 'aminr@gmail.com',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: '123456'
  );
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    // Responsive sizes based on screen height
    final h = MediaQuery.of(context).size.height;
    final vSpace = (h > 800) ? 20.0 : 14.0;
    return Container(
      // The rounded white card that fills most of the screen height
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top icon area with shield/lock and decorative dots
          SizedBox(
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // decorative dots (positions similar to image)
                Positioned(left: 36, top: 18, child: _dot(10, 0.12)),
                Positioned(right: 48, top: 8, child: _dot(14, 0.12)),
                Positioned(right: 28, top: 46, child: _dot(6, 0.12)),

                // Hex-ish shield background
                Transform.rotate(
                  angle: -0.03,
                  child: Container(
                    width: 78,
                    height: 78,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF6C21E8),
                        width: 2.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6C21E8).withOpacity(0.06),
                          blurRadius: 14,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Center(
                      child: iconAsset('logo', height: 40, width: 40),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: vSpace / 1.5),

          // Title
          const Text(
            'Welcome Back to Skill Stack!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF222222),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Build Skill ,Beats Exam',
            style: TextStyle(fontSize: 13, color: Color(0xFF8F8F8F)),
          ),

          SizedBox(height: vSpace * 1.1),

          // Email field
          _InputField(
            controller: _emailController,
            hint: 'Email',
            keyboardType: TextInputType.emailAddress,
            trailing: null,
          ),

          SizedBox(height: 14),

          // Password field
          _InputField(
            controller: _passwordController,
            hint: 'Password',
            keyboardType: TextInputType.text,
            obscureText: _obscure,
            trailing: IconButton(
              onPressed: () => setState(() => _obscure = !_obscure),
              icon: Icon(
                _obscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: const Color(0xFF9E9E9E),
              ),
            ),
          ),

          SizedBox(height: 20),

          // Gradient Login Button
          BlocConsumer<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<AuthenticationCubit>().loginWithEmail(
                      _emailController.text,
                      _passwordController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 6,
                    backgroundColor: Colors.transparent,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7A2BF8), Color(0xFF5C00FF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: const CustomText(
                        text: "Login",
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              );
            },
            listener: (context, state) {
              if (state is LoginLoading) {
                LoadingDialog.show(context, message: "Signing you in...");
              } else {
                LoadingDialog.hide(context);
              }
              if (state is LoginSuccess) {
                showCustomToasts(msg: "Login Successful");
                AppNavigator.goToDashBoard(context);
              } else if (state is LoginFailure) {
                showCustomToasts(msg: state.error);
              }
            },
          ),

          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              // Forgot action
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Forgot password tapped')),
              );
            },
            child: const Text(
              'Forgot password?',
              style: TextStyle(
                color: Color(0xFF6C21E8),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(height: vSpace * 1.2),

          // Spacer then bottom register text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account? ",
                style: TextStyle(color: Color(0xFF9E9E9E)),
              ),
              GestureDetector(
                onTap: () {
                  AppNavigator.goToRegistration(context);
                },
                child: const Text(
                  'Register!',
                  style: TextStyle(
                    color: Color(0xFF6C21E8),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dot(double size, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xFF6C21E8).withOpacity(opacity),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Widget? trailing;
  final TextInputType keyboardType;
  final bool obscureText;

  const _InputField({
    required this.controller,
    required this.hint,
    this.trailing,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // mimic the subtle rounded filled field from the image
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),
          hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
          suffixIcon: trailing != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: trailing,
                )
              : null,
        ),
      ),
    );
  }
}
