import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/shared/background_image_widget.dart';
import 'package:kroenchen_app/features/shared/my_individual_button.dart';
import 'package:kroenchen_app/features/sign_up/widgets/signup_loading_bar.dart';

class RegisterScreenFinish extends StatelessWidget {
  const RegisterScreenFinish({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      image: null,
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 72,
            ),
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: Text(
                      "Fortschrittsbalken",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SignUpLoadingBar(
                    percentageSizeOne: 1,
                    percentageSizeTwo: 0,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Expanded(
                    flex: 10,
                    child: SingleChildScrollView(
                      child: const Image(
                        image: AssetImage("assets/images/k_logo.png"),
                      ),
                    ),
                  ),
                  const Text(
                    "Herzlich Willkommen,",
                    style: TextStyle(fontSize: 28),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Image(
                      image: AssetImage("assets/images/k_crown.png"),
                    ),
                  ),
                  const Text(
                    "MusterNutzer",
                    style: TextStyle(),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  MyIndividualButton(
                      newText: "Zur Homepage",
                      nextSite: () => Navigator.pushNamed(
                          context, "/bottomnavigationbarmain"),
                      icon: null),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
