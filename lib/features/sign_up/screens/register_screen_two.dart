import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/sign_up/widgets/signup_loading_bar.dart';
import 'package:kroenchen_app/shared/widgets/background_image_widget.dart';
import 'package:kroenchen_app/shared/widgets/my_individual_button.dart';
import 'package:kroenchen_app/shared/widgets/textfield_with_border.dart';

class RegisterScreenTwo extends StatelessWidget {
  const RegisterScreenTwo({super.key});

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
                    ),
                  ),
                  const SignUpLoadingBar(
                    percentageSizeOne: 1,
                    percentageSizeTwo: 1,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 48),
                    child: Text(
                      "Was ist dein Geschlecht ?",
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
      ),
    );
  }
}
