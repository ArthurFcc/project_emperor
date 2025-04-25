import 'package:boardgame_collector/bloc/layout/navigation_cubit.dart';
import 'package:boardgame_collector/pages/collection/collection_list.dart';
import 'package:boardgame_collector/pages/home/home.dart';
import 'package:boardgame_collector/pages/layout/navigation.dart';
import 'package:boardgame_collector/pages/profile/profile.dart';
import 'package:boardgame_collector/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final List<Widget> pages = const [Home(), CollectionList(), Profile()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boardgame and Miniature Collector',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: BlocProvider(
        create: (_) => NavigationCubit(),
        child: BlocBuilder<NavigationCubit, int>(
          builder:
              (context, state) => Scaffold(
                appBar: AppBar(
                  actionsPadding: EdgeInsets.only(right: 21),
                  title: Padding(
                    padding: EdgeInsets.only(left: 6),
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
                body: pages.elementAt(state),
                bottomNavigationBar: Navigation(),
              ),
        ),
      ),
    );
  }
}
