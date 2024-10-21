import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/Homepage/screens/diary_screen.dart';
import 'package:kroenchen_app/features/Homepage/screens/homepage.dart';
import 'package:kroenchen_app/features/Homepage/screens/settings_screen.dart';

class BottomNavigationBarMain extends StatefulWidget {
  const BottomNavigationBarMain({super.key});

  @override
  State<BottomNavigationBarMain> createState() =>
      _BottomNavigationBarMainState();
}

class _BottomNavigationBarMainState extends State<BottomNavigationBarMain> {
  final List<Widget> widgets = [
    const Homepage(),
    const DiaryScreen(),
    const SettingsScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          currentIndex = index;
          setState(() {});
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined), label: "Homepage"),
          NavigationDestination(
              icon: Icon(Icons.book_outlined), label: "Diary"),
          NavigationDestination(
              icon: Icon(Icons.settings_outlined), label: "Settings"),
        ],
      ),
      body: widgets[currentIndex],
    );
  }
}
