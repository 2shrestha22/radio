import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radio/utils/const.dart';

const _seed = Colors.red;

ThemeData appTheme() => _buildTheme(Brightness.light);
ThemeData appDarkTheme() => _buildTheme(Brightness.dark);

ThemeData _buildTheme(Brightness brightness) {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: _seed,
    brightness: brightness,
  );
  final textTheme = GoogleFonts.latoTextTheme(
    brightness == Brightness.dark ? ThemeData.dark().textTheme : ThemeData.light().textTheme,
  );
  return ThemeData(
    colorScheme: colorScheme,
    dividerTheme: DividerThemeData(
      color: colorScheme.outlineVariant.withValues(alpha: 0.3),
    ),
    splashFactory: NoSplash.splashFactory,
    appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
    textTheme: textTheme,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: kBorderRadius,
      ),
    ),
  );
}
