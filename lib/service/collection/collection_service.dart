import 'package:boardgame_collector/service/collection/collection_data.dart';
import 'package:boardgame_collector/service/collection/new_collection_data.dart';
import 'package:boardgame_collector/service/http_client.dart';
import 'package:boardgame_collector/util/map_extension.dart';

class CollectionService {
  late CustomHttpClient _dioClient;

  CollectionService() {
    _dioClient = CustomHttpClient();
  }

  Future<List<CollectionData>> fetchCollections(String searchText) async {
    var response = await _dioClient.get(
      '/collection/GetAll',
      queryParms: {'SearchText': searchText},
    );

    if (response.statusCode == 200) {
      var collections = (response.data as Map<String, dynamic>)
          .parseJsonList<CollectionData>(CollectionData.fromJson);

      return collections.items;
    } else {
      return List.empty();
    }
  }

  Future<bool> createCollection(NewCollectionData collection) async {
    var response = await _dioClient.post(
      '/collection/Create',
      payload: collection.toJson(),
    );
    if (response.statusCode == 200) return true;
    return false;
  }
}
