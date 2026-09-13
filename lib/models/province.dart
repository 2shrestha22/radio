import 'package:radio/models/radio_station.dart';

class Province {
  const Province({required this.id, required this.name, required this.stations});

  final int id;
  final String name;
  final List<RadioStation> stations;
}
