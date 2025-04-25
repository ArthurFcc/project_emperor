import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boardgame_collector/bloc/layout/navigation_cubit.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.shelves), label: "Collection"),
        NavigationDestination(
          icon: Icon(Icons.person_rounded),
          label: "Profile",
        ),
      ],
      onDestinationSelected:
          (value) =>
              BlocProvider.of<NavigationCubit>(context).changeIndex(value),
      selectedIndex: BlocProvider.of<NavigationCubit>(context).state,
    );
  }
}
