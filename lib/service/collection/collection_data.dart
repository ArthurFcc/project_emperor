import 'package:boardgame_collector/service/shared/entity.dart';

class CollectionData extends Entity {
  final String title;
  final String description;
  final List<String> boardGames;
  final List<String> miniatures;

  late int numberOfGames;
  late int numberOfMiniatures;

  CollectionData(
    super.id,
    this.title,
    this.description,
    this.boardGames,
    this.miniatures,
  ) {
    numberOfGames = boardGames.length;
    numberOfMiniatures = miniatures.length;
  }
}
