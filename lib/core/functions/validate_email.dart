import 'package:email_validator/email_validator.dart';

String? validatorEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  if(!EmailValidator.validate(value)){
    return 'Please enter valid email';
  }
  return null;
}