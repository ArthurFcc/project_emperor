import 'dart:typed_data';

final class NewCollectionData {
  final Uint8List? cover;
  final String title;
  final String description;

  NewCollectionData({
    this.cover,
    required this.title,
    required this.description,
  });
}
