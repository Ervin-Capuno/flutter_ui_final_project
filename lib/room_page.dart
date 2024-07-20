import 'package:flutter/material.dart';

class RoomPage extends StatelessWidget {
  final double temperature;
  final double lightLevel;
  final String backgroundImage;

  const RoomPage({
    Key? key,
    required this.temperature,
    required this.lightLevel,
    required this.backgroundImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Details'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              backgroundImage,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  Text(
                    'Temperature: ${temperature.toStringAsFixed(1)}°C',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Light Level: ${lightLevel.toStringAsFixed(1)}%',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
