import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';
import 'package:kroenchen_app/features/mainscreen/widgets/document_detail_screen.dart';
import 'package:kroenchen_app/shared/models/document.dart';
import 'package:kroenchen_app/shared/repository/database_repository.dart';
import 'package:kroenchen_app/shared/repository/shared_preferences_database.dart';
import 'package:kroenchen_app/shared/widgets/background_image_widget.dart';
import 'package:provider/provider.dart';

class DocumentStorageScreen extends StatefulWidget {
  const DocumentStorageScreen({super.key});

  @override
  State<DocumentStorageScreen> createState() => _DocumentStorageScreenState();
}

class _DocumentStorageScreenState extends State<DocumentStorageScreen> {
  List<Document> documents = [];

  @override
  void initState() {
    super.initState();
    _loadDocuments();
  }

  Future<void> _loadDocuments() async {
    final db = Provider.of<DatabaseRepository>(context, listen: false);
    final loadedDocs = await db.getDocuments();
    setState(() {
      documents = loadedDocs;
    });
  }

  Future<void> _createNewDocument() async {
    final TextEditingController nameController = TextEditingController();

    final String? documentName = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        // backgroundColor: brighterPurple,
        title: const Text(
          "Neues Dokument erstellen",
        ),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: "Name des Dokuments",
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: const Text(
              "Abbrechen",
            ),
          ),
          TextButton(
            onPressed: () =>
                Navigator.of(context).pop(nameController.text.trim()),
            child: const Text(
              "Erstellen",
            ),
          ),
        ],
      ),
    );

    if (documentName != null && documentName.isNotEmpty) {
      final newDocument = Document(
        id: DateTime.now().toString(),
        name: documentName,
        filePaths: [],
        addedDate: DateTime.now(),
      );

      final db = Provider.of<SharedPreferencesDatabase>(context, listen: false);
      await db.addDocument(newDocument);

      setState(() {
        documents.add(newDocument);
      });
    }
  }

  Future<void> _deleteDocument(String documentId) async {
    final db = Provider.of<SharedPreferencesDatabase>(context, listen: false);
    await db.deleteDocument(documentId);

    setState(() {
      documents.removeWhere((doc) => doc.id == documentId);
    });
  }

  Future<void> _showDeleteConfirmation(String documentId) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Ordner löschen?",
        ),
        content: const Text(
          "Möchtest du dieses Dokument wirklich löschen?",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              "Abbrechen",
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              "Löschen",
            ),
          ),
        ],
      ),
    );

    if (shouldDelete == true) {
      await _deleteDocument(documentId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: Scaffold(
        body: documents.isEmpty
            ? const Center(
                child: Text("Keine Dokumente gespeichert"),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final doc = documents[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DocumentDetailScreen(document: doc),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: backgroundColorPurpleGradient,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Column(
                            children: [
                              Expanded(
                                child: doc.filePaths.isNotEmpty
                                    ? Image.file(
                                        File(doc.filePaths.first),
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      )
                                    : const Icon(Icons.insert_drive_file,
                                        size: 50, color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 4.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        doc.name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () =>
                                          _showDeleteConfirmation(doc.id),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: buttonBlue,
          onPressed: _createNewDocument,
          child: Icon(
            Icons.add,
            color: brighterPurple,
          ),
        ),
      ),
    );
  }
}
