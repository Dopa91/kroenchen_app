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
                    widthBoxOne: 370,
                    widthBoxTwo: 0,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  const Image(image: AssetImage("assets/images/k_logo.png")),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  const Text(
                    "Herzlich Willkommen,",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
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
                    flex: 3,
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
