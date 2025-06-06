import 'package:boardgame_collector/bloc/collections/collection_list_cubit.dart';
import 'package:boardgame_collector/bloc/collections/new_collection/new_collection_cubit.dart';
import 'package:boardgame_collector/pages/collection/collection.dart';
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
    final FocusNode searchFocusNode = FocusNode();

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CollectionListCubit, CollectionListState>(
          builder:
              (context, state) => SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(
                        left: 21,
                        right: 21,
                        top: 12,
                      ),
                      child: SearchBar(
                        hintText: "Search",
                        focusNode: searchFocusNode,
                        leading: Padding(
                          padding: EdgeInsetsGeometry.only(left: 8),
                          child: Icon(Icons.search),
                        ),
                        onTapOutside: (event) => searchFocusNode.unfocus(),
                      ),
                    ),
                    state.status == FetchStatus.loading
                        ? Center(
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(),
                          ),
                        )
                        : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          addAutomaticKeepAlives: true,
                          addRepaintBoundaries: true,
                          itemCount: state.collections.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          itemBuilder:
                              (context, index) => GestureDetector(
                                onTap:
                                    () => openCollection(
                                      context,
                                      state.collections[index].id,
                                    ),
                                child: CollectionCard(
                                  id: state.collections[index].id,
                                  boardgameCount:
                                      state.collections[index].numberOfGames,
                                  description:
                                      state.collections[index].description,
                                  title: state.collections[index].title,
                                ),
                              ),
                        ),
                  ],
                ),
              ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () => openNewCollectionDialog(context),
          child: Icon(Icons.add_rounded),
        ),
      ),
    );
  }

  void openNewCollectionDialog(BuildContext context) =>
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          fullscreenDialog: true,
          barrierDismissible: false,
          builder:
              (context) => BlocProvider(
                create: (context) => NewCollectionCubit(),
                child: NewCollection(),
              ),
        ),
      );

  void openCollection(BuildContext context, int id) => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => Collection()));
}
