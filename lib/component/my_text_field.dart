import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        focusNode: focusNode,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade100,
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide.none),
        ),
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
