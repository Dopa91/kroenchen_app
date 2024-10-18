import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/k_logo.png"),
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/images/bober.jpg"),
                ),
              ],
            ),
            Text(
              "Willkommen,",
            ),
            Text(
              "MusterNutzer",
            ),
            Text("Placeholder für Kalendar"),
          ],
        ),
      ),
    );
  }
}
