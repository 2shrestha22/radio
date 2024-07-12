import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:radio/app.dart';
import 'package:radio/radio_station.dart';
import 'package:radio/shared_pref.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
