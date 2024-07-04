import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import 'weather_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Stack( // Use a Stack for layering
        children: [
          // Background image container
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/brian-mcgowan-kKyxIwvljBg-unsplash.jpg"), // Replace with your image path
                fit: BoxFit.cover, // Adjust fit as needed (cover, contain, etc.)
              ),
            ),
          ),
          // Center the content horizontally using a Center widget
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Restrict column size
                children: [
                  // Enhanced TextField with larger size, bold white text, and dark black border
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter city name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black, // Dark black border
                          width: 2.0, // Border thickness
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black, // Dark black border for active state
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black, // Dark black border for focused state
                          width: 2.0,
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0), // Increased padding
                      labelStyle: TextStyle(
                        color: Colors.grey, // Adjust label color as needed
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white, // White text color
                        fontWeight: FontWeight.bold, // Bold font style
                        fontSize: 20.0, // Larger font size
                      ),
                    ),
                    style: TextStyle( // Apply text style for entered text (optional)
                      color: Colors.black, // Adjust text color as needed
                      fontSize: 18.0, // Adjust entered text size
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (_controller.text.isNotEmpty) {
                        await context.read<WeatherProvider>().fetchWeather(_controller.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherScreen(),
                          ),
                        );
                      }
                    },
                    child: Text('Get Weather'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

