import 'package:boardgame_collector/pages/collection/widgets/collection_card.dart';
import 'package:flutter/material.dart';

class CollectionList extends StatefulWidget {
  const CollectionList({super.key});

  @override
  State<CollectionList> createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        padding: EdgeInsets.only(top: 12),
        itemBuilder: (context, index) => CollectionCard(),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {},
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
