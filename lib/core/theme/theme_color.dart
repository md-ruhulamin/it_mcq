import 'package:flutter/material.dart';
import 'package:it_mcq/core/theme/theme_extension.dart';

class AppThemeColors {
  static Color background(BuildContext context) =>
      context.isDark ? const Color(0xFF2A2A2A).withOpacity(0.9) : Colors.white;

  static Color textPrimary(BuildContext context) =>
      context.isDark ? Colors.white : Colors.black87;

  static Color textSecondary(BuildContext context) =>
      context.isDark ? Colors.white.withOpacity(0.7) : Colors.black87.withOpacity(0.7);

  static Color iconBg(BuildContext context) =>
      context.isDark ? Colors.white : Colors.indigo.shade100;

  static Color shadow(BuildContext context) =>
      context.isDark ? Colors.black.withOpacity(0.1) : Colors.black.withOpacity(0.04);
}
