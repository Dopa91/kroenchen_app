import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/mainscreen/widgets/homepage_calendar.dart';
import 'package:kroenchen_app/features/mainscreen/widgets/profil_account_picture.dart';
import 'package:kroenchen_app/features/shared/background_image_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(
              24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ProfilAccountPicture(
                      radius: 64,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Willkommen,",
                        ),
                        Text(
                          "MusterNutzer",
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(243, 105, 133, 165),
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: HomepageCalendar(),
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
