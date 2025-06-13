import 'package:boardgame_collector/service/shared/entity.dart';
import 'package:boardgame_collector/service/shared/paged_result.dart';

extension ListFetchConverter on Map<String, dynamic> {
  PagedResult<TEntityParse> parseJsonList<TEntityParse extends Entity>(
    Function jsonFunc,
  ) {
    List<TEntityParse> parsedData = [];
    var totalCount = this['totalCount'];

    for (var item in this['items'] as List<dynamic>) {
      parsedData.add(jsonFunc(item));
    }

    return PagedResult(totalCount: totalCount, items: parsedData);
  }
}
