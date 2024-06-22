import 'package:flutter/material.dart';
import 'package:radio/app.dart';
import 'package:radio/radio_station.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadStations();
  runApp(const App());
}
