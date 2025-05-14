import 'package:boardgame_collector/bloc/collections/collection_list_cubit.dart';
import 'package:boardgame_collector/pages/collection/new_collection.dart';
import 'package:boardgame_collector/pages/collection/widgets/collection_card.dart';
import 'package:boardgame_collector/service/shared/fetch_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionList extends StatefulWidget {
  const CollectionList({super.key});

  @override
  State<CollectionList> createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CollectionListCubit>(context).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CollectionListCubit, CollectionListState>(
        builder:
            (context, state) =>
                state.status == FetchStatus.loading
                    ? Center(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(),
                      ),
                    )
                    : ListView.builder(
                      itemCount: state.collections.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      itemBuilder:
                          (context, index) => CollectionCard(
                            id: state.collections[index].id,
                            boardgameCount:
                                state.collections[index].numberOfGames,
                            description: state.collections[index].description,
                            title: state.collections[index].title,
                          ),
                    ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () => openNewCollectionDialog(context),
        child: Icon(Icons.add_rounded),
      ),
    );
  }

  void openNewCollectionDialog(BuildContext context) =>
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          fullscreenDialog: true,
          barrierDismissible: false,
          builder: (context) => NewCollection(),
        ),
      );
}
