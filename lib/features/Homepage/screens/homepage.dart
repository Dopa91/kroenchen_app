import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/Homepage/widgets/profil_account_picture.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            24.0,
          ),
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
                    ProfilAccountPicture(),
                  ],
                ),
                SizedBox(
                  height: 16,
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
        ),
      ),
    );
  }
}
