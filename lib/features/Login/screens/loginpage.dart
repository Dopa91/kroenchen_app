import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kroenchen_app/features/login/widgets/sign_in_divider.dart';
import 'package:kroenchen_app/features/login/widgets/sign_up_icon_button.dart';
import 'package:kroenchen_app/features/shared/background_image_widget.dart';
import 'package:kroenchen_app/features/shared/my_individual_button.dart';
import 'package:kroenchen_app/features/shared/textfield_with_border.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      image: null,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/k_logo.png",
                      ),
                    ],
                  ),
                ),
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Login \nMelde dich jetzt an",
                  ),
                ],
              ),
              const TextFieldBox(
                text: 'Email',
              ),
              const TextFieldBox(
                text: 'Password',
              ),
              SizedBox(
                height: 16,
              ),
              MyIndividualButton(
                newText: "Login",
                nextSite: () =>
                    Navigator.pushNamed(context, "/bottomnavigationbarmain"),
                icon: Ionicons.log_in_outline,
              ),
              SizedBox(
                height: 16,
              ),
              MyIndividualButton(
                newText: "Registrieren",
                nextSite: () =>
                    Navigator.pushNamed(context, "/registerscreenstart"),
                icon: null,
                // icon: Ionicons.people_circle_outline,
              ),
              SizedBox(
                height: 16,
              ),
              SignInDivider(),
              SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignUpIconButton(
                    icon: Ionicons.logo_apple,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  SignUpIconButton(
                    icon: Ionicons.logo_google,
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
