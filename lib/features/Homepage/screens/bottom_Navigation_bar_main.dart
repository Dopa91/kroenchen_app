import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';
import 'package:kroenchen_app/features/Homepage/screens/diary_screen.dart';
import 'package:kroenchen_app/features/Homepage/screens/homepage.dart';
import 'package:kroenchen_app/features/Homepage/screens/settings_screen.dart';

class BottomNavigationBarMain extends StatefulWidget {
  const BottomNavigationBarMain(
      {super.key, required this.isSwitched, required this.onChanged});

  final bool isSwitched;
  final void Function(bool) onChanged;

  @override
  State<BottomNavigationBarMain> createState() =>
      _BottomNavigationBarMainState();
}

class _BottomNavigationBarMainState extends State<BottomNavigationBarMain> {
  late List<Widget> widgets;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    widgets = [
      const Homepage(),
      const DiaryScreen(),
      SettingsScreen(
        isSwitched: widget.isSwitched,
        onChanged: (bool newValue) {
          widget.onChanged(newValue);
          setState(() {});
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        indicatorColor: brighterPurple,
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
      body: switch (currentIndex) {
        0 => Homepage(),
        1 => DiaryScreen(),
        2 => SettingsScreen(
            isSwitched: widget.isSwitched,
            onChanged: widget.onChanged,
          ),
        _ => Homepage(),
      },
    );
  }
}
