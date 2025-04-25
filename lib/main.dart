import 'package:boardgame_collector/bloc/shared/navigation/cubit/navigation_cubit.dart';
import 'package:boardgame_collector/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boardgame and Miniature Collector',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: BlocProvider(
        create: (_) => NavigationCubit(),
        child: Scaffold(
          appBar: AppBar(
            actionsPadding: EdgeInsets.only(right: 21),
            title: Text(
              "Hello, Arthur 👋",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(color: Colors.white),
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

          body: Column(
            children: [
              Row(children: [Text("Test")]),
            ],
          ),
          bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
            builder:
                (context, state) => NavigationBar(
                  labelBehavior:
                      NavigationDestinationLabelBehavior.onlyShowSelected,
                  destinations: [
                    NavigationDestination(
                      icon: Icon(Icons.home),
                      label: "Home",
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.shelves),
                      label: "Collection",
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.person_2_rounded),
                      label: "Profile",
                    ),
                  ],
                  onDestinationSelected:
                      (value) => BlocProvider.of<NavigationCubit>(
                        context,
                      ).changeIndex(value),
                  selectedIndex: state,
                ),
          ),
        ),
      ),
    );
  }
}
