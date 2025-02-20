import 'package:flutter/material.dart';
import 'package:kroenchen_app/shared/widgets/background_image_widget.dart';
import 'package:kroenchen_app/shared/widgets/my_individual_button.dart';

class RegisterScreenFinish extends StatelessWidget {
  const RegisterScreenFinish({super.key});

  @override
  Widget build(BuildContext context) {
    final String userName =
        ModalRoute.of(context)?.settings.arguments as String? ?? "MusterNutzer";

    return BackgroundImageWidget(
      image: null,
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 72),
            child: Column(
              children: [
                const Expanded(flex: 1, child: SizedBox()),
                const Image(image: AssetImage("assets/images/k_logo.png")),
                const SizedBox(height: 16),
                const Text(
                  "Herzlich Willkommen,",
                  style: TextStyle(fontSize: 28),
                ),
                const SizedBox(height: 16),
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                MyIndividualButton(
                  newText: "Zur Homepage",
                  nextSite: () =>
                      Navigator.pushNamed(context, "/bottomnavigationbarmain"),
                  icon: Icons.home,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
