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
          return const Center(child: CircularProgressIndicator());
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
              child: ListTile(
                title: Text(entry.content),
                subtitle: Text(
                  "Datum: ${formatDate(entry.date)}\nFieber: ${entry.hasFever ? 'Ja' : 'Nein'}\nBlut im Stuhl: ${entry.pain ? 'Ja' : 'Nein'}",
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => onEdit(entry),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => onDelete(entry),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
