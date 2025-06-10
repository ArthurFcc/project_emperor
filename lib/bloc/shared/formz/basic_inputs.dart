import 'package:boardgame_collector/bloc/shared/formz/input_error.dart';
import 'package:formz/formz.dart';

enum EmailInputError { empty, invalid }

enum PhoneInputError { empty, length, invalid }

class BasicTextFieldInput extends FormzInput<String, InputError> {
  const BasicTextFieldInput.pure() : super.pure('');
  const BasicTextFieldInput.dirty({String value = ''}) : super.dirty(value);

  @override
  InputError? validator(String value) {
    if (value.isEmpty) {
      return InputError.empty;
    }
    return null;
  }
}

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty) {
      return EmailInputError.empty;
    } else if (!_emailRegExp.hasMatch(value)) {
      return EmailInputError.invalid;
    }

    return null;
  }
}

class PhoneInput extends FormzInput<String, PhoneInputError> {
  const PhoneInput.pure() : super.pure('');
  const PhoneInput.dirty({String value = ''}) : super.dirty(value);

  @override
  PhoneInputError? validator(String value) => null;
}
