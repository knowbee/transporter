String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegExp.hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your phone number';
  }
  final phoneNumberRegExp = RegExp(r'^[0-9]{10}$');
  if (!phoneNumberRegExp.hasMatch(value)) {
    return 'Please enter a valid phone number';
  }
  return null;
}

bool isEmail(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  }
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegExp.hasMatch(value);
}

bool isPhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  }
  final phoneNumberRegExp = RegExp(r'^[0-9]{10}$');
  return phoneNumberRegExp.hasMatch(value);
}

bool isValidPassword(String value) {
  return RegExp(
    r'^(?=.*[\d@$!%*#?&])[A-Za-z\d@$!%*#?&]*$',
  ).hasMatch(value);
}
