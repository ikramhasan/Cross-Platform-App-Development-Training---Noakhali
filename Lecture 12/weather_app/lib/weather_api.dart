import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApi {
  Future<Map<String, dynamic>> getWeather() async {
    var url = Uri.parse('https://goweather.herokuapp.com/weather/bangladesh');
    var response = await http.get(url);
    return jsonDecode(response.body);
  }
}
