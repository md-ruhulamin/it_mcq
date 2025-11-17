import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:it_mcq/resources/color_pallet.dart';
class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? label;
  final bool? alignLabelWithHint;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final String? hintText;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? err;
  final bool? enabled;
  final bool? readOnly;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool? autofocus;
  final TextStyle? style;

  const CustomTextFormField(
      {super.key,
      this.controller,
      this.inputFormatters,
      this.label,
      this.prefix,
      this.validator,
      this.keyboardType,
      this.err,
      this.enabled,
      this.suffix,
      this.maxLength,
      this.minLines = 1,
      this.maxLines = 1,
      this.focusNode,
      this.readOnly,
      this.hintText,
      this.onChanged,
      this.onTap,
      this.autofocus = false,
      this.style,
      this.alignLabelWithHint,
      this.initialValue, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        autofocus: autofocus!,
        focusNode: focusNode,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        enabled: enabled,
        maxLength: maxLength,
        readOnly: readOnly ?? false,
        minLines: maxLines! > 3 ? null : 1,
        // minLines: minLines,
        maxLines: maxLines,
        style: style ??
            const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        decoration: InputDecoration(
          label: label,
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500, color: Color(0xff6B7280)),
          fillColor: clrGrey9F9,
          filled: true,
          prefix: prefix,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle:  TextStyle(
              fontWeight: FontWeight.w500, color: Color(0xff6B7280)),
          suffixIcon: suffix,
          alignLabelWithHint: alignLabelWithHint ?? false,
          enabledBorder:
              const UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder:
              const UnderlineInputBorder(borderSide: BorderSide.none),
          errorBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
          disabledBorder:
              const UnderlineInputBorder(borderSide: BorderSide.none),
          focusedErrorBorder:
              const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
        validator: validator,
      ),
    );
  }
}
