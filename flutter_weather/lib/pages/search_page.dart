import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/service model.dart';
import '../Service/weather Service.dart';
import '../provider/weather_provider.dart';

class searchPage extends StatelessWidget {
  searchPage({super.key});
  String? cityname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a City',
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(
            // onChanged: (data) {
            // print(data);
            // },
            onSubmitted: (data) async {
              cityname = data;
              WeatherService service = WeatherService();
              weatherModel? Weather =
                  await service.getService(cityname: cityname!);
              //print(Weather);
              // weatherData = Weather mean in kol data f object dh
              Provider.of<Witherprovider>(context, listen: false).weatherData =
                  Weather;
                   Provider.of<Witherprovider>(context, listen: false).cityName = cityname;
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 13, vertical: 28),
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter City Name',
              hintStyle: TextStyle(fontSize: 15),
              label: Text("Search"),
              labelStyle: TextStyle(fontSize: 20),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}

weatherModel? WeatherData;
