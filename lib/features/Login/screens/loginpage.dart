// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kroenchen_app/features/login/widgets/sign_in_divider.dart';
import 'package:kroenchen_app/features/login/widgets/sign_up_icon_button.dart';
import 'package:kroenchen_app/shared/repository/auth_repository.dart';
import 'package:kroenchen_app/shared/widgets/background_image_widget.dart';
import 'package:kroenchen_app/shared/widgets/my_individual_button.dart';
import 'package:kroenchen_app/shared/widgets/textfield_with_border.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    final authRepo = Provider.of<AuthRepository>(context, listen: false);
    try {
      await authRepo.signInWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      Navigator.pushNamed(context, "/bottomnavigationbarmain");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login fehlgeschlagen: ${e.toString()}")),
      );

      log("Fehler beim Login: $e");
    }
  }

  Future<void> loginWithGoogle() async {
    final authRepo = Provider.of<AuthRepository>(context, listen: false);
    try {
      await authRepo.signInWithGoogle();
      Navigator.pushNamed(context, "/bottomnavigationbarmain");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Google Login fehlgeschlagen: ${e.toString()}"),
        ),
      );
      log("Fehler beim Google-Login: $e");
    }
  }

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
                      Image.asset("assets/images/k_logo.png"),
                    ],
                  ),
                ),
              ),
              const Row(
                children: [
                  SizedBox(width: 8),
                  Text("Login \nMelde dich jetzt an"),
                ],
              ),
              TextFieldBox(
                text: 'Email',
                controller: emailController,
              ),
              TextFieldBox(
                text: 'Password',
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 16),
              MyIndividualButton(
                newText: "Login",
                nextSite: login,
                icon: Ionicons.log_in_outline,
              ),
              const SizedBox(height: 16),
              MyIndividualButton(
                newText: "Registrieren",
                nextSite: () =>
                    Navigator.pushNamed(context, "/registerscreenstart"),
                icon: Icons.app_registration,
              ),
              const SizedBox(height: 16),
              const SignInDivider(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SignUpIconButton(icon: Ionicons.logo_apple),
                  const SizedBox(width: 8),
                  SignUpIconButton(
                    icon: Ionicons.logo_google,
                    onPressed: loginWithGoogle,
                  ),
                ],
              ),
              const Expanded(flex: 1, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
