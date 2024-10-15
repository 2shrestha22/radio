import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio_background/just_audio_background.dart';
import 'package:radio/app.dart';
import 'package:radio/models/radio_station.dart';
import 'package:radio/utils/shared_pref.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();

  // JustAudioMediaKit.ensureInitialized();

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
  // TODO: add option to load from assets for github in settings page.

  final remoteUri = Uri.parse(
      'https://cdn.jsdelivr.net/gh/2shrestha22/radio/assets/radio_list.json');

  String data;
  if (kDebugMode) {
    // always load from assets in debug mode.
    data = await rootBundle.loadString("assets/radio_list.json");
  } else {
    // else get data from github repository
    try {
      data = await http
          .get(remoteUri)
          .timeout(
            const Duration(seconds: 5),
            onTimeout: () => throw const SocketException('Timeout'),
          )
          .then((value) => value.body);
    } catch (_) {
      data = await rootBundle.loadString("assets/radio_list.json");
    }
  }
  allRadioStations =
      (jsonDecode(data) as List).map((e) => RadioStation.fromJson(e)).toList();
}
