import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/shared/my_individual_button.dart';
import 'package:kroenchen_app/features/shared/signup_loading_bar.dart';
import 'package:kroenchen_app/features/shared/textfield_with_border.dart';

class RegisterScreenTwo extends StatelessWidget {
  const RegisterScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ),
                ),
                const SignUpLoadingBar(
                  widthBoxOne: 150,
                  widthBoxTwo: 220,
                ),
                const SizedBox(
                  height: 48,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 48),
                  child: Text(
                    "Wie möchtest du genannt werden ?",
                  ),
                ),
                const TextFieldBox(text: "Male"),
                const TextFieldBox(text: "Female"),
                const TextFieldBox(text: "Divers"),
                const Expanded(
                  child: SizedBox(),
                ),
                MyIndividualButton(
                    newText: "Weiter",
                    nextSite: () =>
                        Navigator.pushNamed(context, "/registerscreenthree"),
                    icon: null),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
