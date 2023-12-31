import 'package:flutter/material.dart';

class weatherModel {
  DateTime date;
  double avgtemp;
  double maxtemp;
  double mintemp;
  String condition;

  weatherModel(
      {required this.date,
      required this.avgtemp,
      required this.maxtemp,
      required this.mintemp,
      required this.condition});

  // Name constructor **
  // factory lazem rutern object **
  factory weatherModel.fromJson(dynamic data) {
    var jsondata = data['forecast']['forecastday'][0]['day'];
    //** */ print('maxtemp=${jsondata['mintemp_c']}');
    //date= data['location']['localtime'];
    // avgtemp= jsondata['avgtemp_c'];
    //maxtemp= jsondata['maxtemp_c'];
    //mintemp= jsondata['mintemp_c'];
    //condition= jsondata['ondition']['text"'];
    return weatherModel(
      date: DateTime.parse(data['location']['localtime']),
      avgtemp: jsondata['avgtemp_c'],
      maxtemp: jsondata['maxtemp_c'],
      mintemp: jsondata['mintemp_c'],
      condition: jsondata['condition']['text'],
    );
  }
  @override
  String toString() {
    return 'avgtemp=$avgtemp maxtemp=$maxtemp mintemp=$mintemp condition=$condition date=$date';
  }
  String getImage() {
    if (condition == 'Sunny' ||
        condition == 'Clear' ||
        condition == 'partly cloudy') {
      return 'assets/images/clear.png'; //flutter_weather/assets/images/clear.png
    } else if (condition == 'Blizzard' ||
        condition == 'Patchy snow possible' ||
        condition == 'Patchy sleet possible' ||
        condition == 'Patchy freezing drizzle possible' ||
        condition == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (condition == 'Freezing fog' ||
        condition == 'Fog' ||
        condition == 'Heavy Cloud' ||
        condition == 'Mist' ||
        condition == 'Fog') {
      return ' assets/images/cloudy.png';
    } else if (condition == 'Patchy rain possible' ||
        condition == 'Heavy Rain' ||
        condition == 'Showers	') {
      return ' assets/images/rainy.png';
    } else if (condition == 'Thundery outbreaks possible' ||
        condition == 'Moderate or heavy snow with thunder' ||
        condition == 'Patchy light snow with thunder' ||
        condition == 'Moderate or heavy rain with thunder' ||
        condition == 'Patchy light rain with thunder') {
      return ' assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
  MaterialColor getThemeColor() {
    if (condition == 'Sunny' ||
        condition == 'Clear' ||
        condition == 'partly cloudy') {
      return Colors.orange;
    } else if (condition == 'Blizzard' ||
        condition == 'Patchy snow possible' ||
        condition == 'Patchy sleet possible' ||
        condition == 'Patchy freezing drizzle possible' ||
        condition == 'Blowing snow') {
      return Colors.blue;
    } else if (condition == 'Freezing fog' ||
        condition == 'Fog' ||
        condition == 'Heavy Cloud' ||
        condition == 'Mist' ||
        condition == 'Fog') {
      return Colors.blueGrey;
    } else if (condition == 'Patchy rain possible' ||
       condition == 'Heavy Rain' ||
        condition == 'Showers	') {
      return Colors.blue;
    } else if (condition == 'Thundery outbreaks possible' ||
       condition == 'Moderate or heavy snow with thunder' ||
        condition == 'Patchy light snow with thunder' ||
        condition == 'Moderate or heavy rain with thunder' ||
        condition == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }

}
