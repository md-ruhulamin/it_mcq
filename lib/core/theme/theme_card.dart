import 'package:flutter/material.dart';
import 'package:it_mcq/core/theme/theme_extension.dart';


class ThemedCard extends StatelessWidget {
  final Widget child;
  const ThemedCard({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
