import 'package:flutter/material.dart';
import 'package:it_mcq/core/theme/theme_color.dart';

import 'package:it_mcq/core/theme/theme_extension.dart';

class ThemedText extends StatelessWidget {
  final String text;
  final bool secondary;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow overflow;

  const ThemedText(
    this.text, {
    this.secondary = false,
    this.style,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = secondary
        ? AppThemeColors.textSecondary(context)
        : AppThemeColors.textPrimary(context);
    return Text(
      text,
      style: (style ?? const TextStyle()).copyWith(color: color),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
