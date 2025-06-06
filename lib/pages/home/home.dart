import 'package:boardgame_collector/util/theme.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 21, top: 12),
        title: Padding(
          padding: EdgeInsets.only(left: 6, top: 12),
          child: Text(
            "Hello, Arthur 👋",
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.copyWith(color: Colors.white),
          ),
        ),
        actions: [
          IconButton.filled(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_rounded,
              color: AppColors.backgroundLighten1,
            ),
          ),
        ],
      ),
    );
  }
}
