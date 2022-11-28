import 'package:flutter/material.dart';

class WeatherDisplay extends StatelessWidget {
  final String title;
  final String location;
  const WeatherDisplay({
    Key? key,
    required this.title,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/weather.jpg"),
            opacity: 40,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              location,
              style: const TextStyle(
                backgroundColor: Colors.black,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            Text(
              '$title ${'°C'}',
              style: const TextStyle(
                backgroundColor: Colors.black,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
