import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kroenchen_app/shared/repository/database_repository.dart';
import 'package:provider/provider.dart';

class ProfilAccountPicture extends StatelessWidget {
  final double radius;

  const ProfilAccountPicture({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DatabaseRepository>(context, listen: false);

    return FutureBuilder<String?>(
      future: db.getProfilePicture(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircleAvatar(
            radius: radius,
            backgroundColor: Colors.grey,
            child: const CircularProgressIndicator(),
          );
        }

        final filePath = snapshot.data;
        if (filePath == null || filePath.isEmpty) {
          return CircleAvatar(
            radius: radius,
            backgroundColor: Colors.grey,
            child: const Icon(Icons.person, size: 48),
          );
        }

        return CircleAvatar(
          radius: radius,
          backgroundImage: FileImage(File(filePath)),
        );
      },
    );
  }
}
