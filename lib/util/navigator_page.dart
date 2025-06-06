import 'package:flutter/material.dart';

class NavigatorPage extends StatefulWidget {
  final Widget child;
  final GlobalKey navigatorKey;

  const NavigatorPage({
    super.key,
    required this.navigatorKey,
    required this.child,
  });

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute:
          (settings) => MaterialPageRoute(
            settings: settings,
            builder: (context) => widget.child,
          ),
    );
  }
}
