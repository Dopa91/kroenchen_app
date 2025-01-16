import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kroenchen_app/config/colors.dart';
import 'package:kroenchen_app/shared/models/document.dart';
import 'package:kroenchen_app/shared/repository/database_repository.dart';
import 'package:kroenchen_app/shared/widgets/background_image_widget.dart';
import 'package:provider/provider.dart';
import 'package:kroenchen_app/shared/repository/shared_preferences_database.dart';

class DocumentDetailScreen extends StatefulWidget {
  final Document document;

  const DocumentDetailScreen({super.key, required this.document});

  @override
  State<DocumentDetailScreen> createState() => _DocumentDetailScreenState();
}

class _DocumentDetailScreenState extends State<DocumentDetailScreen> {
  late Document document;

  @override
  void initState() {
    super.initState();
    document = widget.document;
  }

  Future<void> _addPage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      // ignore: use_build_context_synchronously
      final db = Provider.of<DatabaseRepository>(context, listen: false);
      document.filePaths.add(pickedFile.path);
      await db.editDocument(document);
      setState(() {});
    }
  }

  Future<void> _deletePage(int index) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: darkerButtonBlue,
        title: const Text(
          "Seite löschen?",
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          "Möchtest du diese Seite wirklich löschen?",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child:
                const Text("Abbrechen", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("Löschen", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (shouldDelete == true) {
      // ignore: use_build_context_synchronously
      final db = Provider.of<SharedPreferencesDatabase>(context, listen: false);
      document.filePaths.removeAt(index);
      await db.editDocument(document);
      setState(() {});
    }
  }

  void _showImagePreview(String filePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(filePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            document.name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: document.filePaths.isEmpty
            ? const Center(
                child: Text(
                  "Keine Seiten hinzugefügt.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: document.filePaths.length,
                  itemBuilder: (context, index) {
                    final filePath = document.filePaths[index];
                    return GestureDetector(
                      onTap: () => _showImagePreview(filePath),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: backgroundColorPurpleGradient,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                File(filePath),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deletePage(index),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: buttonBlue,
          onPressed: () async {
            final source = await showDialog<ImageSource>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text(
                  "Seite hinzufügen",
                ),
                content: const Text(
                  "Wählen Sie eine Option:",
                  style: TextStyle(color: Colors.black),
                ),
                actions: [
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pop(ImageSource.camera),
                    child: const Text(
                      "Kamera",
                    ),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pop(ImageSource.gallery),
                    child: const Text(
                      "Galerie",
                    ),
                  ),
                ],
              ),
            );
            if (source != null) await _addPage(source);
          },
          child: Icon(Icons.add, color: brighterPurple),
        ),
      ),
    );
  }
}
