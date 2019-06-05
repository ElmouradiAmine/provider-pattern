import 'package:flutter/foundation.dart';

class WeatherInfo with ChangeNotifier {
  String _tempType = "celcius";
  double _tempVal = 25;

  double get tempVal => _tempVal;
  String get tempType => _tempType;

  set temperatureValue(double temp) {
    _tempVal = temp;
    notifyListeners();
  }

  set temperatureType(String tempType) {
    _tempType = tempType;
    notifyListeners();
  }
}
