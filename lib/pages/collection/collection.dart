import 'package:boardgame_collector/pages/collection/widgets/boardgame_card.dart';
import 'package:flutter/material.dart';

class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _ViewCollectionState();
}

class _ViewCollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                children: [
                  Row(
                    children: [
                      Text(
                        "Collection Name",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  Text(
                    "My super big description. My dungeon crawler boardgame collection",
                    softWrap: true,
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(color: Colors.white60),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    addAutomaticKeepAlives: true,
                    addRepaintBoundaries: true,
                    itemCount: 7,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    itemBuilder: (context, index) => BoardgameCard(),
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
      Container(
        height: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            isAntiAlias: true,
            image: AssetImage("assets/image.jpg"), // Change to only file
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
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
