// part 'province.freezed.dart';

import 'package:radio/models/radio_station.dart';

sealed class Province {
  Province({required this.id, required this.name, required this.stations});

  final int id;
  final String name;
  final List<RadioStation> stations;
}

class UnknownProvince extends Province {
  UnknownProvince({
    required super.stations,
  }) : super(id: -1, name: 'Unknown');
}

class KoshiProvince extends Province {
  KoshiProvince({
    required super.stations,
  }) : super(id: 1, name: 'Koshi');
}

class MadheshProvince extends Province {
  MadheshProvince({
    required super.stations,
  }) : super(id: 1, name: 'Madhesh');
}

class BagmatiProvince extends Province {
  BagmatiProvince({
    required super.stations,
  }) : super(id: 1, name: 'Bagmati');
}

class GandakiProvince extends Province {
  GandakiProvince({
    required super.stations,
  }) : super(id: 1, name: 'Gandaki');
}

class LumbiniProvince extends Province {
  LumbiniProvince({
    required super.stations,
  }) : super(id: 1, name: 'Lumbini');
}

class KarnaliProvince extends Province {
  KarnaliProvince({
    required super.stations,
  }) : super(id: 1, name: 'Karnali');
}

class SudurpaschimProvince extends Province {
  SudurpaschimProvince({
    required super.stations,
  }) : super(id: 1, name: 'Sudurpaschim');
}
