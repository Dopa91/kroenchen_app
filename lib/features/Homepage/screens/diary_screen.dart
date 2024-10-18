import 'package:flutter/material.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/k_logo.png"),
              ),
            ),
            child: const Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Hier kommt die Tagebuchfunktion rein, mit übersicht und eintrag erstellen",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
