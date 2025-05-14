import 'package:boardgame_collector/service/collection/collection_data.dart';
import 'package:boardgame_collector/service/collection/collection_service.dart';
import 'package:boardgame_collector/service/shared/fetch_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'collection_list_state.dart';

final class CollectionListCubit extends Cubit<CollectionListState> {
  CollectionListCubit() : super(CollectionListState());

  final collectionService = CollectionService();

  Future<void> fetchData() async {
    emit(state.copyWith(status: FetchStatus.loading));

    final collections = await collectionService.fetchCollections();

    emit(
      state.copyWith(
        status: FetchStatus.success,
        collections: collections,
        hasReachedMax: true,
      ),
    );
  }
}
