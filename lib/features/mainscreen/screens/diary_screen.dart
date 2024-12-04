import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';
import 'package:kroenchen_app/features/mainscreen/widgets/diary_entry_dialog.dart';
import 'package:kroenchen_app/features/mainscreen/widgets/diary_entry_list.dart';
import 'package:kroenchen_app/shared/models/diary.dart';
import 'package:kroenchen_app/shared/repository/database_repository.dart';
//import 'package:kroenchen_app/shared/repository/mock_database.dart';
import 'package:kroenchen_app/shared/repository/shared_preferences_database.dart';
import 'package:kroenchen_app/shared/widgets/background_image_widget.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  DiaryScreenState createState() => DiaryScreenState();
}

class DiaryScreenState extends State<DiaryScreen> {
  final DatabaseRepository databaseRepository = SharedPreferencesDatabase();
  late Future<List<DiaryEntry>> entriesFuture;

  @override
  void initState() {
    super.initState();
    entriesFuture = databaseRepository.getDiaryEntries();
  }

  void _refreshEntries() {
    setState(() {
      entriesFuture = databaseRepository.getDiaryEntries();
    });
  }

  void _openDiaryEntryDialog({DiaryEntry? diaryEntry}) {
    showDialog(
      context: context,
      builder: (context) => DiaryEntryDialog(
        existingEntry: diaryEntry,
        onSave: (newEntry) async {
          if (diaryEntry == null) {
            await databaseRepository.createDiaryEntry(newEntry);
          } else {
            await databaseRepository.editDiaryEntry(newEntry);
          }
          _refreshEntries();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: buttonBlue,
          onPressed: () => _openDiaryEntryDialog(),
          child: Icon(Icons.add, color: brighterPurple),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: DiaryEntryList(
              entriesFuture: entriesFuture,
              onEdit: (entry) => _openDiaryEntryDialog(diaryEntry: entry),
              onDelete: (entry) async {
                await databaseRepository.deleteDiaryEntry(entry);
                _refreshEntries();
              },
            ),
          ),
        ),
      ),
    );
  }
}
