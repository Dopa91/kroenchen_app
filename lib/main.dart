import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: const Scaffold(
        body: Center(
          child: Text('Hello World!,ich teste es nur '),
        ),
      ),
    );
  }
}
