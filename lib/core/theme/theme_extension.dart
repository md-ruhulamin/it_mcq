import 'package:flutter/material.dart';

extension ThemeX on BuildContext {
  Color get primary => Theme.of(this).colorScheme.primary;
  Color get surface => Theme.of(this).colorScheme.surface;
  Color get onSurface => Theme.of(this).colorScheme.onSurface;
  Color get background => Theme.of(this).colorScheme.background;
  Color get textPrimary => isDark ? Colors.white : Colors.black87;

  Color get textSecondary =>
      isDark ? Colors.white.withOpacity(0.7) : Colors.black87.withOpacity(0.7);
  TextStyle get heading => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get body => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
