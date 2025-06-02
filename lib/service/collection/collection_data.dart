import 'package:boardgame_collector/service/shared/entity.dart';

class CollectionData extends Entity {
  final String title;
  final String description;
  final List<String> boardGames;
  final List<String> miniatures;

  late int numberOfGames;
  late int numberOfMiniatures;

  CollectionData(
    super.id, {
    required this.title,
    required this.description,
    required this.boardGames,
    required this.miniatures,
  }) {
    numberOfGames = boardGames.length;
    numberOfMiniatures = miniatures.length;
  }

  @override
  set fromJson(Map<String, dynamic> json) {}
}
