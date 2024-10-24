import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kroenchen_app/features/Homepage/screens/diary_screen.dart';
import 'package:kroenchen_app/features/Homepage/screens/document_storage_screen.dart';
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
      DocumentStorageScreen(),
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
        // indicatorShape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(8),
        //   ),
        // ),
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          currentIndex = index;
          setState(() {});
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Ionicons.home_outline,
              size: 28,
            ),
            label: "Homepage",
          ),
          NavigationDestination(
              icon: Icon(
                Ionicons.book_outline,
                size: 28,
              ),
              label: "Diary"),
          NavigationDestination(
              icon: Icon(
                Ionicons.documents_outline,
                size: 28,
              ),
              label: "Dokumente"),
          NavigationDestination(
              icon: Icon(
                Ionicons.settings_outline,
                size: 28,
              ),
              label: "Settings"),
        ],
      ),
      body: switch (currentIndex) {
        0 => Homepage(),
        1 => DiaryScreen(),
        2 => DocumentStorageScreen(),
        3 => SettingsScreen(
            isSwitched: widget.isSwitched,
            onChanged: widget.onChanged,
          ),
        _ => Homepage(),
      },
    );
  }
}
