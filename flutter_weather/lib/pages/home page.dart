import 'package:flutter/material.dart';
import 'package:flutter_weather/Model/service%20model.dart';
import 'package:flutter_weather/pages/search_page.dart';
import 'package:provider/provider.dart';

import '../provider/weather_provider.dart';

class homepage extends StatefulWidget {
  homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  weatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<Witherprovider>(context).weatherData;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return searchPage();
                  }));
                },
                icon: const Icon(Icons.search)),
          ],
          title: const Text('Weather App'),
        ),
        body: weatherData == null
            ? const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('there is no weather 😔 start',
                        style: TextStyle(
                          fontSize: 25,
                        )),
                    Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    weatherData!.getThemeColor(),
                    //const Color.fromARGB(255, 65, 148, 216),
                    weatherData!.getThemeColor()[100]!,
                    weatherData!.getThemeColor()[300]!,
                    // 2 ! shan etakd anaha msh null
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),

                //color: weatherData!.getThemeColor(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      Provider.of<Witherprovider>(context).cityName!,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Updated at ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text('max:${weatherData!.maxtemp.toInt()}'),
                            Text('min:${weatherData!.mintemp.toInt()}'),
                          ],
                        ),
                        Image.asset(
                          weatherData!.getImage(),
                        ),
                        Text(
                          '${weatherData!.avgtemp.toInt().toString()} C° ',
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      weatherData!.condition,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
