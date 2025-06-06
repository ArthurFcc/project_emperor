import 'package:flutter/material.dart';

class CollectionCard extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final int boardgameCount;

  const CollectionCard({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.boardgameCount,
  });

  /*
    Add cover image to collections
  */

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
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    isAntiAlias: true,
                    image: AssetImage(
                      "assets/image.jpg",
                    ), // Change to only file
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.gamepad_rounded),
                    SizedBox(width: 4),
                    Text(
                      '$boardgameCount',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 12),
            Text(description, style: Theme.of(context).textTheme.bodyLarge),
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
                      'Created at: 05/13/2025',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'Last modified: 05/13/2025',
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
