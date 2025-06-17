import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xff252345);
  static const backgroundLighten1 = Color(0xff48447B);
  static const backgroundLighten2 = Color(0xff554F87);
  static const secondary = Color(0xff887ABA);
  static const secondaryLighten1 = Color(0xffBBA6ED);
  static const secondaryLighten2 = Color(0xffCDB5FF);
  static const primary = Color(0xffEBBCBA);
  static const success = Color(0xff037B47);
  static const error = Color(0xffdb2828);
  static const info = Color(0xff2185d0);
  static const warn = Color(0xfffbbd08);
}

class AppTheme {
  static var dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.background,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}
