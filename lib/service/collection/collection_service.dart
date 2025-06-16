import 'dart:convert';
import 'package:boardgame_collector/service/collection/collection_data.dart';
import 'package:boardgame_collector/service/collection/new_collection_data.dart';
import 'package:boardgame_collector/service/http_client.dart';
import 'package:boardgame_collector/util/map_extension.dart';

class CollectionService {
  late CustomHttpClient _dioClient;

  CollectionService() {
    _dioClient = CustomHttpClient();
  }
  // Added Future 'cause future calls will be http
  Future<List<CollectionData>> fetchCollections(String searchText) async {
    var collections = await _dioClient.get<CollectionData>(
      '/collection/GetAll',
      CollectionData.fromJson,
      queryParms: {'SearchText': searchText},
    );

    return collections.items;
  }

  Future<CollectionData> createCollection(NewCollectionData collection) async {
    var newCollection = await _dioClient.post(
      '/collection/Create',
      payload: jsonEncode(collection),
    );

    return newCollection.parseJson(CollectionData.fromJson);
  }
}
