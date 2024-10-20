import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: buttonBlue,
        mini: true,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return const SizedBox(
                height: 256,
                width: 256,
                child: Center(
                  child: Text("Hello"),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: brighterPurple,
        ),
      ),
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
