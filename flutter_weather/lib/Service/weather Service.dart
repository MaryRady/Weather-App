import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/service model.dart';

class WeatherService {
  String baseUri = 'http://api.weatherapi.com/v1';
  String apikey = '1f9c2c823f3248d8802144942232806';
  Future<weatherModel?> getService({required String cityname}) async {
    weatherModel? weather;
    try {
      Uri uri =
          Uri.parse('$baseUri/forecast.json?key=$apikey&q=$cityname&days=7');
      http.Response response = await http.get(uri);
      // response.body data mogda f body

      /// Decode return data to easy access
      ///  response.body btkon String but defecal acceses
      Map<String, dynamic> data = jsonDecode(response.body);

      // print(data);
      //String dtat = data['location']['localtime'];
      //String avgtemp = data['forecast']['forecastday'][0]['avgtemp_c'];

       weather = weatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
