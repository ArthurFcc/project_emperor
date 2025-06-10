import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:boardgame_collector/bloc/shared/formz/basic_inputs.dart';
import 'package:boardgame_collector/bloc/profile/formz/edit_profile.dart';

part 'edit_profile_state.dart';

final class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileState());

  void fullNameChanged(String fullName) {
    var fullNameInput = FullNameInput.dirty(value: fullName);
    emit(
      state.copyWith(
        fullName: fullNameInput,
        isValid: Formz.validate([
          fullNameInput,
          state.email,
          state.phoneNumber,
        ]),
      ),
    );
  }

  void emailChanged(String email) {
    var emailInput = EmailInput.dirty(value: email);
    emit(
      state.copyWith(
        email: emailInput,
        isValid: Formz.validate([
          state.fullName,
          emailInput,
          state.phoneNumber,
        ]),
      ),
    );
  }

  void phoneChanged(String phone) {
    var phoneInput = PhoneInput.dirty(value: phone);
    emit(
      state.copyWith(
        phoneNumber: phoneInput,
        isValid: Formz.validate([state.fullName, state.email, phoneInput]),
      ),
    );
  }

  Future<void> editProfilePicture(XFile newImage) async {
    emit(
      state.copyWith(
        profilePicture: newImage,
        isValid: Formz.validate([
          state.fullName,
          state.email,
          state.phoneNumber,
        ]),
      ),
    );
  }
}
