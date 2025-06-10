part of 'edit_profile_cubit.dart';

final class EditProfileState extends Equatable {
  const EditProfileState({
    this.fullName = const FullNameInput.pure(),
    this.email = const EmailInput.pure(),
    this.phoneNumber = const PhoneInput.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.profilePicture,
  });

  final FullNameInput fullName;
  final EmailInput email;
  final PhoneInput phoneNumber;
  final XFile? profilePicture;
  final FormzSubmissionStatus status;
  final bool isValid;

  EditProfileState copyWith({
    FullNameInput? fullName,
    EmailInput? email,
    PhoneInput? phoneNumber,
    XFile? profilePicture,
    FormzSubmissionStatus? status,
    bool? isValid,
  }) => EditProfileState(
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    profilePicture: profilePicture ?? this.profilePicture,
    status: status ?? this.status,
    isValid: isValid ?? this.isValid,
  );

  @override
  List<Object?> get props => [
    fullName,
    email,
    phoneNumber,
    profilePicture,
    status,
    isValid,
  ];
}
