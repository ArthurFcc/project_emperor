part of 'collection_list_cubit.dart';

final class CollectionListState extends Equatable {
  const CollectionListState({
    this.hasReachedMax = false,
    this.status = FetchStatus.initial,
    this.collections = const <CollectionData>[],
  });

  final FetchStatus status;
  final bool hasReachedMax;
  final List<CollectionData> collections;

  CollectionListState copyWith({
    FetchStatus? status,
    List<CollectionData>? collections,
    bool? hasReachedMax,
  }) {
    return CollectionListState(
      status: status ?? this.status,
      collections: collections ?? this.collections,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [status, collections, hasReachedMax];
}
