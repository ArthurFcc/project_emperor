import 'package:boardgame_collector/service/collection/collection_data.dart';
import 'package:boardgame_collector/service/http_client.dart';

class CollectionService {
  late CustomHttpClient _dioClient;

  CollectionService() {
    _dioClient = CustomHttpClient();
  }
  // Added Future 'cause future calls will be http
  Future<List<CollectionData>> fetchCollections() async {
    var response = await _dioClient.get('/boardgame/GetAll');

    return [];
  }
}
