import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kroenchen_app/config/colors.dart';
import 'package:kroenchen_app/shared/background_image_widget.dart';

class DocumentStorageScreen extends StatelessWidget {
  const DocumentStorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: buttonBlue,
          mini: true,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const SizedBox(
                  height: 512,
                  width: 256,
                  child: Center(
                    child: Text(
                      "Function to Scan/take picture & save docs",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
            );
          },
          child: Icon(
            Ionicons.scan,
            color: brighterPurple,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              decoration: const BoxDecoration(),
              child: const Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                            "Hier kommt die Dikumentenablage hin, ein Ort zum Speichern von Laborwerten, KH-Berichtw uvm."),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
