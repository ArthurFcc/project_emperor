part of 'new_collection_cubit.dart';

final class NewCollectionState extends Equatable {
  const NewCollectionState({
    this.name = '',
    this.description = '',
    this.coverImage,
  });

  final String name;
  final String description;
  final XFile? coverImage;

  NewCollectionState copyWith({
    String? name,
    String? description,
    XFile? coverImage,
  }) => NewCollectionState(
    name: name ?? this.name,
    description: description ?? this.description,
    coverImage: coverImage ?? this.coverImage,
  );

  @override
  List<Object?> get props => [name, description, coverImage];
}
