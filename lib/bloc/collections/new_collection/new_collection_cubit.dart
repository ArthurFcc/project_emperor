import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'new_collection_state.dart';

final class NewCollectionCubit extends Cubit<NewCollectionState> {
  NewCollectionCubit() : super(NewCollectionState());

  Future<void> addCoverImage(XFile newImage) async {
    emit(state.copyWith(coverImage: newImage));
  }
}
