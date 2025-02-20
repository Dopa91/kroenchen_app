// ignore_for_file: use_build_context_synchronously
import 'dart:ui';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kroenchen_app/config/colors.dart';
import 'package:kroenchen_app/features/mainscreen/widgets/profil_account_picture.dart';
import 'package:kroenchen_app/shared/repository/database_repository.dart';
import 'package:kroenchen_app/shared/widgets/background_image_widget.dart';
import 'package:kroenchen_app/shared/widgets/my_individual_button.dart';
import 'package:kroenchen_app/shared/repository/auth_repository.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    required this.isSwitched,
    required this.onChanged,
  });

  final bool isSwitched;
  final void Function(bool) onChanged;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String userName = "MusterNutzer";

  @override
  void initState() {
    super.initState();
    _loadProfileName();
  }

  Future<void> _loadProfileName() async {
    final db = Provider.of<DatabaseRepository>(context, listen: false);
    final name = await db.getProfileName();
    setState(() => userName = name ?? "MusterNutzer");
  }

  Future<void> logout(BuildContext context) async {
    final authRepo = Provider.of<AuthRepository>(context, listen: false);
    await authRepo.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, "/loginscreen", (route) => false);
  }

  Future<void> _changeProfilPicture(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final db = Provider.of<DatabaseRepository>(context, listen: false);
      await db.saveProfilePicture(pickedFile.path);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profilbild erfolgreich aktualisiert!")),
      );
    }
  }

  Future<void> _changeProfileName(BuildContext context) async {
    final TextEditingController nameController = TextEditingController();
    final db = Provider.of<DatabaseRepository>(context, listen: false);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Profilname ändern"),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(hintText: "Neuer Name"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Abbrechen"),
          ),
          TextButton(
            onPressed: () async {
              final newName = nameController.text.trim();
              if (newName.isNotEmpty) {
                await db.saveProfileName(newName);
                setState(() => userName = newName); // 🔥 UI-Update
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Profilname geändert zu '$newName'")),
                );
                Navigator.of(context).pop();
              }
            },
            child: const Text("Speichern"),
          ),
        ],
      ),
    );
  }

  Future<void> showLogoutAlertDialog(BuildContext context) async {
    final logoutState = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ausloggen'),
        content: const Text(
          'Möchtest du dich wirklich ausloggen?',
          style: TextStyle(color: Colors.black54),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Abbrechen'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Ja, ausloggen'),
          ),
        ],
      ),
    );

    if (logoutState == true) {
      await logout(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: AnimatedToggleSwitch<bool>.dual(
                current: widget.isSwitched,
                first: false,
                second: true,
                onChanged: widget.onChanged,
                style: ToggleStyle(
                  backgroundColor: Colors.black12,
                  indicatorColor: widget.isSwitched
                      ? buttonBlue
                      : darkerBackgroundColorPurple,
                  borderColor: Colors.grey.shade800,
                ),
                iconBuilder: (value) => value
                    ? Icon(Icons.light_mode, color: sun)
                    : Icon(Icons.dark_mode, color: moon),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(flex: 2, child: SizedBox(height: 16)),
                const ProfilAccountPicture(radius: 96),
                const Expanded(flex: 4, child: SizedBox(height: 8)),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(50),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(50),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0.42, sigmaY: 0.42),
                          child: const SizedBox(
                            height: 69,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Schön dich zu sehen!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              userName, // 🔥 Dynamisch geladener Name
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 36,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(flex: 5, child: SizedBox(height: 16)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  child: Column(
                    children: [
                      MyIndividualButton(
                        newText: "Profilname ändern",
                        nextSite: () => _changeProfileName(context),
                        icon: Ionicons.people_outline,
                      ),
                      const SizedBox(height: 16),
                      MyIndividualButton(
                        newText: "Profilbild ändern",
                        nextSite: () => _changeProfilPicture(context),
                        icon: Ionicons.image_outline,
                      ),
                      const SizedBox(height: 16),
                      MyIndividualButton(
                        newText: "Logout",
                        nextSite: () => showLogoutAlertDialog(context),
                        icon: Ionicons.log_out_outline,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
