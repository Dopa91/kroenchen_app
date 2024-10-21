import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/Login/widgets/sign_up_icon_button.dart';
import 'package:kroenchen_app/features/shared/my_individual_button.dart';
import 'package:kroenchen_app/features/shared/textfield_with_border.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Image.asset("assets/images/k_logo.png"),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 12,
              ),
              child: Row(
                children: [
                  Text(
                    "Login",
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 12,
              ),
              child: Row(
                children: [
                  Text(
                    "Melde dich jetzt an",
                  ),
                ],
              ),
            ),
            const TextFieldBox(
              text: 'Emaill',
            ),
            const TextFieldBox(
              text: 'Password',
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 72,
              ),
              child: MyIndividualButton(
                newText: "Login",
                nextSite: () => Navigator.pushNamed(context, "/homepage"),
                icon: Icons.arrow_forward,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
              ),
              child: MyIndividualButton(
                newText: "Registrieren",
                nextSite: () =>
                    Navigator.pushNamed(context, "/registerscreenstart"),
                icon: Icons.arrow_forward,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Divider(),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignUpIconButton(
                  icon: Icons.apple_outlined,
                ),
                SizedBox(
                  width: 8,
                ),
                SignUpIconButton(
                  icon: Icons.g_mobiledata_outlined,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
