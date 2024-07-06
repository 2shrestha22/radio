import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme() => ThemeData(
      textTheme: GoogleFonts.latoTextTheme(),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        // filled: true,
      ),
    );
