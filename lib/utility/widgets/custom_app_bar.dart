import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final Widget? leading;
  final Color color;
  final double elevation;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.centerTitle = false,
    this.leading,
    this.color = Colors.white,
    this.elevation = 0,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    final isFirstRoute = ModalRoute.of(context)?.isFirst ?? true;

    return AppBar(
      backgroundColor: color,
      elevation: elevation,
      centerTitle: centerTitle,
      leading: isFirstRoute
          ? null
          : IconButton(
              icon: leading ??
                  const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                    size: 20,
                  ),
              onPressed: () => Navigator.of(context).pop(),
            ),
      title: title,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + (bottom?.preferredSize.height ?? 0.0),
      );
}

class CustomHeader extends StatelessWidget {
  final String title;
  final Widget? leading;

  const CustomHeader({super.key, required this.title, this.leading});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 12),
          IconButton(
            icon: leading == null
                ? const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                    size: 20,
                  )
                : leading!,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(width: 16),
          Text(title)
        ],
      ),
    );
  }
}
