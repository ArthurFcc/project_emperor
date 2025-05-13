import 'package:boardgame_collector/components/inputs/my_textinput.dart';
import 'package:boardgame_collector/pages/collection/new_collection.dart';
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
        itemCount: 7,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 12),
        itemBuilder:
            (context, index) => CollectionCard(
              id: 1,
              boardgameCount: 5,
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam facilisis fermentum est at tempus.",
              title: "RPG",
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
