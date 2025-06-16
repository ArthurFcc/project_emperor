import 'dart:typed_data';

import 'package:boardgame_collector/bloc/shared/formz/basic_inputs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

part 'new_collection_state.dart';

final class NewCollectionCubit extends Cubit<NewCollectionState> {
  NewCollectionCubit() : super(NewCollectionState());

  void titleChanged(String fullName) {
    var titleInput = BasicTextFieldInput.dirty(value: fullName);

    emit(
      state.copyWith(
        title: titleInput,
        isValid: Formz.validate([titleInput, state.description]),
      ),
    );
  }

  void descriptionChanged(String email) {
    var descriptionInput = BasicTextFieldInput.dirty(value: email);
    emit(
      state.copyWith(
        description: descriptionInput,
        isValid: Formz.validate([state.title, descriptionInput]),
      ),
    );
  }

  Future<void> addCoverImage(XFile newImage) async {
    emit(state.copyWith(coverImage: await newImage.readAsBytes()));
  }
}
