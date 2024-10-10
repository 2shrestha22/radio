import 'package:flutter/foundation.dart';

abstract class RadioPlayerException {}

class StationLoadException implements RadioPlayerException {
  @override
  String toString() {
    if (kIsWeb) {
      return "Failed to load the station. Some station are not available for web.";
    }
    return "Failed to load the station. It may not available at this moment.";
  }
}
