import 'package:flutter/material.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 21, vertical: 7),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('RPG', style: Theme.of(context).textTheme.titleLarge),
            Text(
              "My current RPG collection of tabletop games.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.gamepad_rounded),
                SizedBox(width: 4),
                Text('5', style: Theme.of(context).textTheme.titleMedium),
                SizedBox(width: 16),
                Icon(Icons.toys),
                SizedBox(width: 4),
                Text('5', style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
