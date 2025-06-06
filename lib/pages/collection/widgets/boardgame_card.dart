import 'package:flutter/material.dart';

class BoardgameCard extends StatelessWidget {
  const BoardgameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Color(0xFF2A292F),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                isAntiAlias: true,
                image: AssetImage("assets/image.jpg"), // Change to only file
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Massive Darkness 2: Hellscape (2021)"),
                Text("Category: Dungeon Crawler"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
