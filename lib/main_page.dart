import 'package:boardgame_collector/pages/collection/collection_list.dart';
import 'package:boardgame_collector/pages/home/home.dart';
import 'package:boardgame_collector/pages/layout/navigation.dart';
import 'package:boardgame_collector/pages/profile/profile.dart';
import 'package:boardgame_collector/util/navigator_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final int pageIndex;
  const MainPage({super.key, required this.pageIndex});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Map<int, GlobalKey> navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
    3: GlobalKey(),
  };

  final List<Widget> pages = [Home(), CollectionList(), Profile()];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: NavigatorPage(
          navigatorKey: navigatorKeys[widget.pageIndex]!,
          child: pages[widget.pageIndex],
        ),
        bottomNavigationBar: Navigation(),
      ),
    );
  }
}
