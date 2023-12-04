String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your  full name';
  } else {
    return null;
  }
}
String? parentNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter the full name';
  } else {
    return null;
  }
}

String? ageValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your age';
  } else if (int.parse(value) > 100 || int.parse(value) < 18) {
    return 'Please enter a valid age';
  } else {
    return null;
  }
}

String? mobileNumberValidator(String? value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (value == null || value.isEmpty || value.length != 10) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}




