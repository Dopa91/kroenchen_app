import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/shared/my_individual_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/k_logo.png"),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                MyIndividualButton(
                  newText: "Logout",
                  nextSite: () => Navigator.pushNamed(context, "/loginscreen"),
                  icon: Icons.logout,
                ),
                const MyIndividualButton(
                  newText: "Konto Löschen",
                  nextSite: null,
                  icon: Icons.delete_forever,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
