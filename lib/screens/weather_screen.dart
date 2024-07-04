import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = context.watch<WeatherProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => weatherProvider.refreshWeather(),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image container (optional, adjust z-index if needed)
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/kayra-sercan-v10lH6UUEGw-unsplash.jpg"), // Replace with your image path
                fit: BoxFit.cover, // Adjust fit as needed (cover, contain, etc.)
              ),
            ),
          ),
          // Center content vertically and horizontally
          Center(
            child: weatherProvider.weatherData == null
                ? Text('No data', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black))
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Restrict column size
                      crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
                      mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                      children: [
                        Text('City: ${weatherProvider.weatherData!.cityName}', style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black)),
                        Text('Temperature: ${weatherProvider.weatherData!.temperature}°C', style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black)),
                        Text('Condition: ${weatherProvider.weatherData!.condition}', style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black)),
                        Image.network('http://openweathermap.org/img/w/${weatherProvider.weatherData!.icon}.png'),
                        Text('Humidity: ${weatherProvider.weatherData!.humidity}%', style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black)),
                        Text('Wind Speed: ${weatherProvider.weatherData!.windSpeed} m/s', style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black)),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

