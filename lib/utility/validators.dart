String? validateMobileNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a valid mobile number';
  }
  return null;
}


String? validateFirstName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter First Name';
  }
  return null;
}

String? validateLastName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter Last Name';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email address';
  }

  // Regular expression for validating an email
  final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
  );

  if (!emailRegExp.hasMatch(value)) {
    return 'Please enter a valid email address';
  }

  return null; // Valid email
}


String? validateNotEmpty(String? value,{String? msg}) {
  if (value == null || value.isEmpty) {
    return '$msg';
  }
  return null;
}