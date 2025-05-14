import 'package:boardgame_collector/service/collection/collection_data.dart';

class CollectionService {
  // Added Future 'cause future calls will be http
  Future<List<CollectionData>> fetchCollections() async {
    var collections = [
      CollectionData(
        1,
        title: 'RPG',
        description: 'My RPG boardgame collection',
        boardGames: [
          'Call of Cthulhu',
          'Massive Darkness',
          'Massive Darkness 2',
        ],
        miniatures: [],
      ),
      CollectionData(
        2,
        title: 'Casual',
        description: 'My Casual boardgame collection',
        boardGames: ['The Resistance', 'Monkey Palace', 'Tokaido'],
        miniatures: [],
      ),
      CollectionData(
        3,
        title: 'Party',
        description: 'My Party boardgame collection',
        boardGames: [
          'O Jogo dos Sons',
          'Exploding Kittens',
          'Histórias Sinistras',
        ],
        miniatures: [],
      ),
    ];

    return collections;
  }
}
