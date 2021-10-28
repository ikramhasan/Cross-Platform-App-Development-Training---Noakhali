import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/weather_api.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
          future: WeatherApi().getWeather(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String temp = snapshot.data!['temperature'];
              List tempList = temp.split('Â');
              temp = tempList[0] + tempList[1];
              return Stack(
                children: [
                  Lottie.asset(
                    'assets/background.json',
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    left: 16,
                    top: 50,
                    child: Text(
                      'BANGLADESH',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 90,
                    child: Text(
                      temp,
                      style: TextStyle(fontSize: 80),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Lottie.asset('assets/loading.json'),
              );
            }
          }),
    );
  }
}
