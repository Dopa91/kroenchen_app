import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/shared/my_individual_button.dart';
import 'package:kroenchen_app/features/shared/signup_loading_bar.dart';
import 'package:kroenchen_app/features/shared/textfield_with_border.dart';

class RegisterScreenStart extends StatelessWidget {
  const RegisterScreenStart({super.key});

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
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const SignUpLoadingBar(
                  widthBoxOne: 75,
                  widthBoxTwo: 300,
                ),
                const SizedBox(
                  height: 48,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 48),
                  child: Text(
                    "Wie möchtest du genannt werden ?",
                    style: TextStyle(),
                  ),
                ),
                const TextFieldBox(
                  text: 'Name',
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                MyIndividualButton(
                    newText: "Weiter",
                    nextSite: () =>
                        Navigator.pushNamed(context, "/registerscreentwo"),
                    icon: null),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
