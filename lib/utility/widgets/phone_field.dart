import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:it_mcq/resources/color_pallet.dart';
import 'package:phone_form_field/phone_form_field.dart';

import 'custom_textspan.dart';

class PhoneFieldView extends StatelessWidget {
  static const supportedLocales = [
    Locale('en'),
  ];
  final FocusNode? focusNode;
  final PhoneController controller;
  final Function(PhoneNumber)? onChanged;
  final Widget? suffix;
  final bool? enabled;
  final bool? validate;
  final List<PhoneNumberInputValidator>? addValidators;

  const PhoneFieldView({
    super.key,
    required this.controller,
    this.onChanged,
    this.suffix,
    this.enabled = true,
    this.validate = true,
    this.addValidators,
    this.focusNode,
  });

  PhoneNumberInputValidator? _getValidator(BuildContext context) {
    List<PhoneNumberInputValidator> validators = [];
    validators.add(PhoneValidator.validMobile(context));
    if (addValidators != null) {
      for (var v in addValidators!) {
        validators.add(v);
      }
    }

    return validators.isNotEmpty ? PhoneValidator.compose(validators) : null;
  }

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Localizations.override(
        context: context,
        child: Builder(
          builder: (context) {
            return PhoneFormField(
              keyboardType: TextInputType.phone,
              focusNode: focusNode,
              controller: controller,
              cursorHeight: 15,
              isCountryButtonPersistent: true,
              style: const TextStyle(fontWeight: FontWeight.w500),
              autofocus: false,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              autofillHints: const [AutofillHints.telephoneNumber],
              countrySelectorNavigator:
              const CountrySelectorNavigator.draggableBottomSheet(),
              decoration: InputDecoration(
                  suffixIcon: suffix,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0)),
                  alignLabelWithHint: false,
                  // label: Text("Mobile Number" , style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400 , color: Color(0xff6B7280)),),
                  // hint: Text("Mobile Number" , style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400 , color: Color(0xff6B7280)),),
                  label: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextSpan(
                      text1: "Mobile Number", mandatory: true),
                  ),
                  filled: true,
                  fillColor: clrGreyF7F),
              enabled: enabled!,
              countryButtonStyle: const CountryButtonStyle(
                showFlag: false,
                showIsoCode: false,
                showDialCode: true,
                showDropdownIcon: true,
              ),
              validator: validate! ? _getValidator(context) : null,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorColor: Theme.of(context).colorScheme.primary,
              onChanged: onChanged,
            );
          },
        ),
      ),
    );
  }
}