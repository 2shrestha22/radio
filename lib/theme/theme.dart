import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme(BuildContext context) => ThemeData(
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
      ),
      textTheme: GoogleFonts.latoTextTheme(),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
