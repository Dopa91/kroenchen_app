import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/shared/my_individual_button.dart';
import 'package:kroenchen_app/features/SignUp/widgets/signup_loading_bar.dart';
import 'package:kroenchen_app/features/shared/textfield_with_border.dart';

class RegisterScreenThree extends StatelessWidget {
  const RegisterScreenThree({super.key});

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
                  widthBoxOne: 260,
                  widthBoxTwo: 110,
                ),
                const SizedBox(
                  height: 48,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 48),
                  child: Text(
                    "Was ist deine Diagnose",
                    style: TextStyle(),
                  ),
                ),
                const TextFieldBox(text: "Morbus Crohn"),
                const TextFieldBox(text: "Colitis Ulcerosa"),
                const TextFieldBox(text: "Andere"),
                const TextFieldBox(text: "Möchte ich nicht mitteilen"),
                const Expanded(
                  child: SizedBox(),
                ),
                MyIndividualButton(
                    newText: "Weiter",
                    nextSite: () =>
                        Navigator.pushNamed(context, "/registerscreenfinish"),
                    icon: null),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
