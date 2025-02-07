import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/mainscreen/widgets/format_date.dart';
import 'package:kroenchen_app/shared/models/diary.dart';

class DiaryEntryList extends StatelessWidget {
  final List<DiaryEntry> entriesFuture;
  final Function(DiaryEntry) onEdit;
  final Function(DiaryEntry) onDelete;
  final bool isLoading;
  final bool moreEntries;
  final ScrollController scrollController;

  const DiaryEntryList({
    super.key,
    required this.entriesFuture,
    required this.onEdit,
    required this.onDelete,
    required this.isLoading,
    required this.moreEntries,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: entriesFuture.length +
          (moreEntries ? 1 : 0), // +1 für den Ladeindikator
      itemBuilder: (context, index) {
        if (index < entriesFuture.length) {
          final entry = entriesFuture[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: ExpansionTile(
              title: Text(
                "Datum: ${formatDate(entry.date)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                entry.content.length > 28
                    ? '${entry.content.substring(0, 28)}...'
                    : entry.content,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              textColor: Colors.black,
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
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Schmerzen: ${entry.pain ? 'Ja' : 'Nein'}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Blut: ${entry.blood ? 'Ja' : 'Nein'}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        entry.content,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            onPressed: () => onEdit(entry),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(' Löschen ?'),
                                    content: const Text(
                                      'Möchtest du diesen Eintrag wirklich löschen?',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text('Abbrechen'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Löschen'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    ' Löschen Löschen ?'),
                                                content: const Text(
                                                  'BiSt Du DiR WiRkLiCh SiChEr ?! o.O',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    child:
                                                        const Text('Abbrechen'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child:
                                                        const Text('Löschen'),
                                                    onPressed: () {
                                                      onDelete(entry);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height *
                0.725, // 50% der Bildschirmhöhe
            child: Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : Text("Keine weiteren Einträge"),
            ),
          );
        }
      },
    );
  }
}
