import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:just_audio_media_kit/just_audio_media_kit.dart';
import 'package:radio/app.dart';
import 'package:radio/radio_station.dart';
import 'package:radio/shared_pref.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();

  JustAudioMediaKit.ensureInitialized();

  await loadStations();
  await Future.wait([
    JustAudioBackground.init(
        androidNotificationChannelId: 'np.com.sargam.radio.channel.audio',
        androidNotificationChannelName: 'Internet Radio',
        androidNotificationOngoing: true,
        androidNotificationIcon: "drawable/ic_notification"),
    SharedPref.init(),
  ]);

  runApp(const ProviderScope(child: App()));
}

Future<void> loadStations() async {
  final data = await rootBundle.loadString("assets/radio_list.json");
  allRadioStations =
      (jsonDecode(data) as List).map((e) => RadioStation.fromJson(e)).toList();
}
