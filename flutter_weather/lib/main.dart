import 'package:flutter/material.dart';
import 'package:flutter_weather/pages/home%20page.dart';
import 'package:provider/provider.dart';

import 'provider/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        // Witherprovider()not Witherprovider
        return Witherprovider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<Witherprovider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<Witherprovider>(context).weatherData!.getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}
