import 'package:flutter/material.dart';

class ThemedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final VoidCallback? onTap;

  const ThemedContainer({
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius = 10,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final container = Container(
      padding: padding ?? const EdgeInsets.all(12),
      margin: margin,
      decoration: BoxDecoration(
      
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
           
            blurRadius: 8,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );

    return onTap != null
        ? InkWell(onTap: onTap, borderRadius: BorderRadius.circular(borderRadius), child: container)
        : container;
  }
}
