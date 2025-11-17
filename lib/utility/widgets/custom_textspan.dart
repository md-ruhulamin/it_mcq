import 'package:flutter/material.dart';

import '../../resources/color_pallet.dart';


class CustomTextSpan extends StatelessWidget {
  final String text1;
  final bool mandatory;

  const CustomTextSpan(
      {super.key, required this.text1, required this.mandatory});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey),
          ),
          if (mandatory)
            const TextSpan(
              text: '*',
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }
}
