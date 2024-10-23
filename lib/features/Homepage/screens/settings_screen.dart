import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/Homepage/widgets/profil_account_picture.dart';
import 'package:kroenchen_app/features/shared/background_image_widget.dart';
import 'package:kroenchen_app/features/shared/my_individual_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen(
      {super.key, required this.isSwitched, required this.onChanged});

  final bool isSwitched;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          actions: [
            Switch(
              value: isSwitched,
              onChanged: onChanged,
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 16,
                  ),
                ),
                const ProfilAccountPicture(),
                const Expanded(
                  flex: 5,
                  child: SizedBox(
                    height: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  child: Column(
                    children: [
                      MyIndividualButton(
                        newText: "Edit Profil",
                        nextSite: () =>
                            Navigator.pushNamed(context, "/placeholder"),
                        icon: Icons.edit,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      MyIndividualButton(
                        newText: "Logout",
                        nextSite: () =>
                            Navigator.pushNamed(context, "/loginscreen"),
                        icon: Icons.logout,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const MyIndividualButton(
                        newText: "Konto Löschen",
                        nextSite: null,
                        icon: Icons.delete_forever,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
