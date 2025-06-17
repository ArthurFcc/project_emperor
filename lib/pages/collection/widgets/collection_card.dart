import 'package:boardgame_collector/service/collection/collection_data.dart';
import 'package:flutter/material.dart';

class CollectionCard extends StatelessWidget {
  final CollectionData collection;

  const CollectionCard({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Color(0xFF2A292F),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      margin: EdgeInsets.symmetric(horizontal: 21, vertical: 7),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 12),
              child:
                  collection.cover != null
                      ? Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            isAntiAlias: true,
                            image: MemoryImage(collection.cover!),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      )
                      : SizedBox(
                        height: 150,
                        child: Center(
                          child: Icon(
                            Icons.image,
                            size: 80,
                            color: Colors.grey,
                          ),
                        ),
                      ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  collection.title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.gamepad_rounded),
                    SizedBox(width: 4),
                    Text(
                      '${collection.boardGames.length}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 12),
            Text(
              collection.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 21),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Created at: ${collection.creationTime}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'Last modified: ${collection.lastUpdateTime ?? '-'}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
