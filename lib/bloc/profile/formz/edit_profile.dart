import 'package:boardgame_collector/bloc/shared/formz/input_error.dart';
import 'package:formz/formz.dart';

class FullNameInput extends FormzInput<String, InputError> {
  const FullNameInput.pure() : super.pure('');
  const FullNameInput.dirty({String value = ''}) : super.dirty(value);

  @override
  InputError? validator(String value) {
    if (value.isEmpty) {
      return InputError.empty;
    }
    return null;
  }
}
