import 'package:flutter/material.dart';
import 'package:it_mcq/resources/text_styles.dart';


import '../resources/color_pallet.dart';

class StorageKeys {
  static String token = 'token';
  static String userId = 'userId';
  static String email = 'email';
  static String firstName = 'firstName';
  static String lastName = 'lastName';
  static String mobile = 'mobile';
  static String internet = 'internet';
  static String fcmToken = 'fcmToken';
  static String language = 'language';
  static String languageScreen = 'languageScreen';
  static String profileImg = 'profileImg';
}


Widget iconAsset(String path,
        {double? height,
        double? width,
        BoxFit? fit,
        Color? color,
        bool? isHandleDirection}) =>
    Image.asset(
      "assets/icons/$path.png",
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      color: color,
      matchTextDirection: isHandleDirection ?? true,
    );

Widget imageAsset(String path,
        {double? height,
        double? width,
        BoxFit? fit,
        Color? color,
        bool? matchTextDirection}) =>
    Image.asset(
      "assets/images/$path.jpg",
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      color: color,
      matchTextDirection: matchTextDirection ?? false,
    );

Widget gifAsset(String path,
        {double? height, double? width, BoxFit? fit, Color? color}) =>
    Image.asset(
      "assets/gifs/$path.gif",
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      color: color,
    );

Widget customHeader(void Function() onTapLeadingButton, BuildContext context,
    {String? text,
    TextStyle? style,
    double? padding,
    String? leadingIcon,
    String? followIcon,
    void Function()? onTapFollowingButton,
    Color? backgroundColor,
    bool isHideBackButton = false}) {
  return Container(
    height: 56,
    color: backgroundColor ?? clrWhiteFFF,
    padding: EdgeInsets.symmetric(horizontal: padding ?? 20),
    child: Row(
      children: [
        if (!isHideBackButton)
          InkWell(
              onTap: onTapLeadingButton,
              child: iconAsset(leadingIcon ?? "arrow_back",
                  width: 24, height: 24, fit: BoxFit.fill)),
        if (!isHideBackButton) const SizedBox(width: 16),
        Text(
          text ?? "",
          style: style ?? st16SemiBold(context),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        if (followIcon != null)
          InkWell(
              onTap: onTapFollowingButton,
              child: iconAsset(followIcon, width: 24, height: 24)),
      ],
    ),
  );
}


// Widget button(String text, void Function() onTapButton,
//         {TextStyle? style,
//         double? radius,
//         double? height,
//         double? width,
//         Color? bgColor,
//         Color? borderColor,
//         bool? isBorder,
//         double? verticalPadding,
//         double? horizontalPadding,
//         double? verticalMargin,
//         double? horizontalMargin}) =>
//     InkWell(
//       onTap: onTapButton,
//       child: Container(
//         height: height,
//         width: width,
//         margin: EdgeInsets.symmetric(
//             horizontal: horizontalMargin ?? 20, vertical: verticalMargin ?? 0),
//         padding: EdgeInsets.symmetric(
//             horizontal: horizontalPadding ?? 12,
//             vertical: verticalPadding ?? 8),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             color: bgColor ?? clrGreen53E,
//             borderRadius: BorderRadius.circular(radius ?? 8),
//             border: Border.all(
//                 color: isBorder == true
//                     ? borderColor ?? Colors.transparent
//                     : Colors.transparent)),
//         child: Text(
//           text,
//           style: style ?? st16SemiBold(con),
//         ),
//       ),
//     );

// Widget bottomBarButton(String text, void Function() onTapButton,
//     {TextStyle? style,
//     double? radius,
//     double? height,
//     double? width,
//     Color? bgColor,
//     Color? borderColor,
//     bool? isBorder,
//     double? verticalPadding,
//     double? horizontalPadding,
//     double? verticalMargin,
//     double? horizontalMargin}) {
//   return SafeArea(
//     child: Container(
//       height: 68,
//       padding: EdgeInsets.symmetric(vertical: 10),
//       decoration: const BoxDecoration(
//         color: Colors.white, // Background color of the widget
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12, // Shadow color
//             offset: Offset(0, -1), // Negative Y = shadow at the top
//             blurRadius: 8,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: InkWell(
//         onTap: onTapButton,
//         child: Container(
//           height: height,
//           width: width,
//           margin: EdgeInsets.symmetric(
//               horizontal: horizontalMargin ?? 20,
//               vertical: verticalMargin ?? 0),
//           padding: EdgeInsets.symmetric(
//               horizontal: horizontalPadding ?? 12,
//               vertical: verticalPadding ?? 8),
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//               color: bgColor ?? clrGreen53E,
//               borderRadius: BorderRadius.circular(radius ?? 8),
//               border: Border.all(
//                   color: isBorder == true
//                       ? borderColor ?? Colors.transparent
//                       : Colors.transparent)),
//           child: Text(
//             text,
//             style: style ?? st16SemiBold(clrWhiteFFF),
//           ),
//         ),
//       ),
//     ),
//   );
// }
