class PagedResult<TEntity> {
  final int totalCount;
  final List<TEntity> items;

  PagedResult({required this.totalCount, required this.items});
}
