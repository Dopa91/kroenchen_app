import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/shared/my_individual_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  child: Column(
                    children: [
                      MyIndividualButton(
                        newText: "Edit Profil",
                        nextSite: () =>
                            Navigator.pushNamed(context, "/placeholder"),
                        icon: Icons.edit,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      MyIndividualButton(
                        newText: "Logout",
                        nextSite: () =>
                            Navigator.pushNamed(context, "/loginscreen"),
                        icon: Icons.logout,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const MyIndividualButton(
                        newText: "Konto Löschen",
                        nextSite: null,
                        icon: Icons.delete_forever,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
