part of 'new_collection_cubit.dart';

final class NewCollectionState extends Equatable {
  const NewCollectionState({
    this.title = const BasicTextFieldInput.pure(),
    this.description = const BasicTextFieldInput.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.coverImage,
  });

  final BasicTextFieldInput title;
  final BasicTextFieldInput description;
  final FormzSubmissionStatus status;
  final bool isValid;
  final XFile? coverImage;

  NewCollectionState copyWith({
    bool? isValid,
    XFile? coverImage,
    BasicTextFieldInput? title,
    FormzSubmissionStatus? status,
    BasicTextFieldInput? description,
  }) => NewCollectionState(
    title: title ?? this.title,
    description: description ?? this.description,
    coverImage: coverImage ?? this.coverImage,
    status: status ?? this.status,
    isValid: isValid ?? this.isValid,
  );

  @override
  List<Object?> get props => [title, description, coverImage, status, isValid];
}
