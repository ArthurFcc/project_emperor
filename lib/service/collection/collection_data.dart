import 'dart:convert';
import 'dart:typed_data';
import 'package:boardgame_collector/service/shared/entity.dart';
import 'package:intl/intl.dart';

class CollectionData extends Entity {
  final Uint8List? cover;
  final String title;
  final String description;
  final String creationTime;
  final String? lastUpdateTime;
  final List<String> boardGames;

  late int numberOfGames;

  CollectionData(
    super.id, {
    this.cover,
    required this.title,
    required this.description,
    required this.boardGames,
    required this.creationTime,
    required this.lastUpdateTime,
  }) {
    numberOfGames = boardGames.length;
  }

  factory CollectionData.fromJson(Map<String, dynamic> json) => CollectionData(
    json['id'],
    cover: json['cover'] != null ? base64Decode(json['cover'] as String) : null,
    title: json['title'] as String,
    description: json['description'] as String,
    creationTime: DateFormat(
      'dd/MM/yyyy HH:mm',
    ).format(DateTime.parse(json['creationTime'])),
    lastUpdateTime:
        json['lastUpdateTime'] != null
            ? DateFormat(
              'dd/MM/yyyy HH:mm',
            ).format(DateTime.parse(json['lastUpdateTime']))
            : null,
    boardGames: [],
  );
}
