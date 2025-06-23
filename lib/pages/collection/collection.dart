import 'package:boardgame_collector/components/buttons/popup_menu.dart';
import 'package:boardgame_collector/pages/collection/widgets/boardgame_card.dart';
import 'package:boardgame_collector/service/collection/collection_data.dart';
import 'package:flutter/material.dart';

class Collection extends StatefulWidget {
  final CollectionData collection;
  const Collection({super.key, required this.collection});

  @override
  State<Collection> createState() => _ViewCollectionState();
}

class _ViewCollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuHelper.buildPopupMenu(
            context,
            onSelected: (value) {},
            optionsList: [
              {"Edit": Icons.edit},
              {"Delete": Icons.delete},
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildCoverImage(),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 21,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.collection.title,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  Text(
                    widget.collection.description,
                    textAlign: TextAlign.justify,
                    softWrap: true,
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(color: Colors.white60),
                  ),
                  Divider(height: 48),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    addAutomaticKeepAlives: true,
                    addRepaintBoundaries: true,
                    itemCount: 7,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    itemBuilder: (context, index) => BoardgameCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Created at: ${widget.collection.creationTime}",
                              style: Theme.of(context).textTheme.titleSmall!
                                  .copyWith(color: Colors.white60),
                            ),
                            if (widget.collection.lastUpdateTime != null)
                              Text(
                                "Modified at: ${widget.collection.lastUpdateTime}",
                                style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(color: Colors.white60),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildCoverImage() => Stack(
    children: [
      widget.collection.cover != null
          ? Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                isAntiAlias: true,
                image: MemoryImage(widget.collection.cover!),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          )
          : SizedBox(
            height: 250,
            child: Center(
              child: Icon(Icons.image, size: 80, color: Colors.grey),
            ),
          ),
      Container(
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              Colors.grey.withAlpha(0),
              Theme.of(context).scaffoldBackgroundColor,
            ],
            stops: [0.0, 1.0],
          ),
        ),
      ),
    ],
  );
}
