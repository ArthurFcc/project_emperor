import 'dart:io';
import 'package:boardgame_collector/bloc/collections/collection_list_cubit.dart';
import 'package:boardgame_collector/bloc/layout/navigation_cubit.dart';
import 'package:boardgame_collector/main_page.dart';
import 'package:boardgame_collector/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final HttpClient client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverride();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boardgame and Miniature Collector',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigationCubit()),
          BlocProvider(create: (_) => CollectionListCubit()),
        ],
        child: BlocBuilder<NavigationCubit, int>(
          builder: (context, state) {
            return MainPage(pageIndex: state);
          },
        ),
      ),
    );
  }
}
