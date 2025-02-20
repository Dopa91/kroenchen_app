import 'package:flutter/material.dart';
import 'package:kroenchen_app/shared/widgets/background_image_widget.dart';
import 'package:kroenchen_app/shared/widgets/my_individual_button.dart';
import 'package:kroenchen_app/shared/widgets/textfield_with_border.dart';
import 'package:kroenchen_app/shared/repository/auth_repository.dart';
import 'package:provider/provider.dart';

class RegisterScreenStart extends StatefulWidget {
  const RegisterScreenStart({super.key});

  @override
  State<RegisterScreenStart> createState() => _RegisterScreenStartState();
}

class _RegisterScreenStartState extends State<RegisterScreenStart> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> _registerUser() async {
    final authRepo = Provider.of<AuthRepository>(context, listen: false);
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("❌ Passwörter stimmen nicht überein!")),
      );
      return;
    }

    try {
      await authRepo.createUserWithEmailAndPassword(email, password);
      Navigator.pushNamed(context, "/registerscreenfinish", arguments: name);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("⚡ Registrierung fehlgeschlagen: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      image: null,
      child: Scaffold(
        appBar: AppBar(forceMaterialTransparency: true),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 72),
            child: Column(
              children: [
                const Text("Wie möchtest du genannt werden?"),
                TextFieldBox(text: 'Name', controller: nameController),
                const SizedBox(height: 16),
                TextFieldBox(text: 'E-Mail', controller: emailController),
                const SizedBox(height: 16),
                TextFieldBox(
                  text: 'Passwort',
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                TextFieldBox(
                  text: 'Passwort bestätigen',
                  controller: confirmPasswordController,
                  obscureText: true,
                ),
                const Expanded(child: SizedBox()),
                MyIndividualButton(
                  newText: "Weiter",
                  nextSite: _registerUser,
                  icon: Icons.arrow_forward,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
