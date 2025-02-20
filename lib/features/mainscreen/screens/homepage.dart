import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/mainscreen/widgets/homepage_calendar.dart';
import 'package:kroenchen_app/features/mainscreen/widgets/profil_account_picture.dart';
import 'package:kroenchen_app/shared/repository/database_repository.dart';
import 'package:kroenchen_app/shared/widgets/background_image_widget.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const ProfilAccountPicture(radius: 64),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Willkommen,"),
                        Text(
                          userName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(243, 105, 133, 165),
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const HomepageCalendar(),
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
