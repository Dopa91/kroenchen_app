import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/shared/my_individual_button.dart';
import 'package:kroenchen_app/features/shared/textfield_with_border.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/k_logo.png"),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12, left: 24, right: 24),
            child: Row(
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 12, left: 24, right: 24),
            child: Row(
              children: [
                Text(
                  "Melde dich jetzt an",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12, left: 24, right: 24),
            child: TextFieldBox(
              text: 'Emaill',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12, left: 24, right: 24),
            child: TextFieldBox(
              text: 'Password',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 64, right: 24, left: 24),
            child: MyIndividualButton(
              newText: "Login",
              nextSite: () => Navigator.pushNamed(context, "/homepage"),
              icon: Icons.arrow_forward,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, right: 24, left: 24),
            child: MyIndividualButton(
              newText: "Registrieren",
              nextSite: () =>
                  Navigator.pushNamed(context, "/registerscreenstart"),
              icon: Icons.arrow_forward,
            ),
          ),
        ],
      ),
    );
  }
}
