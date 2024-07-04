import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weatherData;
  bool _loading = false;
  String? _cityName;

  Weather? get weatherData => _weatherData;
  bool get loading => _loading;

  Future<void> fetchWeather(String cityName) async {
    _loading = true;
    notifyListeners();
    
    _cityName = cityName;
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=3627dfa44a83de64d8e82b7f245c930b';
    
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _weatherData = Weather.fromJson(json.decode(response.body));
      } else {
        _weatherData = null;
      }
    } catch (error) {
      _weatherData = null;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> refreshWeather() async {
    if (_cityName != null) {
      await fetchWeather(_cityName!);
    }
  }
}
