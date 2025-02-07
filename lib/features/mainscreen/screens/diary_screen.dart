import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';
import 'package:kroenchen_app/features/mainscreen/widgets/diary_entry_dialog.dart';
import 'package:kroenchen_app/features/mainscreen/widgets/diary_entry_list.dart';
import 'package:kroenchen_app/shared/models/diary.dart';
import 'package:kroenchen_app/shared/repository/database_repository.dart';
//import 'package:kroenchen_app/shared/repository/mock_database.dart';
// import 'package:kroenchen_app/shared/repository/shared_preferences_database.dart';
import 'package:kroenchen_app/shared/widgets/background_image_widget.dart';
import 'package:provider/provider.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  DiaryScreenState createState() => DiaryScreenState();
}

class DiaryScreenState extends State<DiaryScreen> {
  late DatabaseRepository databaseRepository =
      context.read<DatabaseRepository>();
  final List<DiaryEntry> _entriesFuture = [];
  int _currentPage = 0;
  final int _maxEntriesPage = 10;
  bool _isLoading = false;
  bool _moreEntries = true;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadMoreEntries();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        _moreEntries) {
      _loadMoreEntries();
    }
  }

  Future<void> _loadMoreEntries() async {
    if (_isLoading || !_moreEntries) return;

    setState(() {
      _isLoading = true;
    });

    final newEntries = await databaseRepository.getDiaryEntries(
        page: _currentPage, maxPageSites: _maxEntriesPage);

    setState(() {
      _entriesFuture.addAll(newEntries);
      _currentPage++;
      _isLoading = false;
      _moreEntries = newEntries.length ==
          _maxEntriesPage; // Wenn weniger als maxpageSites zurückkommen, gibt es keine weiteren pages
    });
  }

  void _refreshEntries() {
    setState(() {
      _entriesFuture.clear();
      _currentPage = 0;
      _moreEntries = true;
    });
    _loadMoreEntries();
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
              entriesFuture: _entriesFuture,
              onEdit: (entry) => _openDiaryEntryDialog(diaryEntry: entry),
              onDelete: (entry) async {
                await databaseRepository.deleteDiaryEntry(entry);
                _refreshEntries();
              },
              isLoading: _isLoading,
              moreEntries: _moreEntries,
              scrollController: _scrollController,
            ),
          ),
        ),
      ),
    );
  }
}
