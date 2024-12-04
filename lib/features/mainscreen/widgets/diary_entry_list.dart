import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/mainscreen/widgets/format_date.dart';
import 'package:kroenchen_app/shared/models/diary.dart';

class DiaryEntryList extends StatelessWidget {
  final Future<List<DiaryEntry>> entriesFuture;
  final Function(DiaryEntry) onEdit;
  final Function(DiaryEntry) onDelete;

  const DiaryEntryList({
    super.key,
    required this.entriesFuture,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DiaryEntry>>(
      future: entriesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 16,
          ));
        }
        if (snapshot.hasError) {
          return Center(child: Text("Fehler: ${snapshot.error}"));
        }
        final entries = snapshot.data;
        if (entries == null || entries.isEmpty) {
          return const Center(child: Text("Keine Einträge verfügbar"));
        }
        return ListView.builder(
          itemCount: entries.length,
          itemBuilder: (context, index) {
            final entry = entries[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ExpansionTile(
                title: Text(
                  "Datum: ${formatDate(entry.date)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                subtitle: Text(
                  entry.content.length > 28
                      ? '${entry.content.substring(0, 28)}...'
                      : entry.content,
                  style: const TextStyle(color: Colors.black),
                ),
                textColor: Colors.black, // Farbe des Textes, wenn ausgeklappt
                collapsedTextColor: Colors.black,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fieber: ${entry.hasFever ? 'Ja' : 'Nein'}",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          "Schmerzen: ${entry.pain ? 'Ja' : 'Nein'}",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          "Blut: ${entry.blood ? 'Ja' : 'Nein'}",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          entry.content,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => onEdit(entry),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => onDelete(entry),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
