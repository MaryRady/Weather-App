import 'package:flutter/cupertino.dart';

import '../Model/service model.dart';

class Witherprovider extends ChangeNotifier {
  weatherModel? _weatherData;

  String? cityName;
  //seter
  set weatherData(weatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }
  // geter

  weatherModel? get weatherData => _weatherData;
}