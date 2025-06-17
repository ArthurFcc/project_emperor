import 'dart:convert';
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

  Map<String, dynamic> toJson() => {
    "cover": cover != null ? base64Encode(cover!) : null,
    "title": title,
    "description": description,
  };
}
