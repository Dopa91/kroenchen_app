import 'package:kroenchen_app/shared/repository/database_repository.dart';
import 'package:kroenchen_app/shared/models/appointment.dart';
import 'package:kroenchen_app/shared/models/diary.dart';
import 'package:kroenchen_app/shared/models/document.dart';
import 'package:kroenchen_app/shared/models/user.dart';

class MockDatabase implements DatabaseRepository {
  final List<DiaryEntry> _diaryData = [];
  final List<Document> _documentsData = [];
  String? _profilePicturePath;

  // Diary
  @override
  Future<void> createDiaryEntry(DiaryEntry diaryEntry) async {
    await Future.delayed(Duration(microseconds: 100));
    _diaryData.add(diaryEntry);
  }

  @override
  Future<List<DiaryEntry>> getDiaryEntries(
      {int page = 0, int maxPageSites = 420}) async {
    await Future.delayed(Duration(seconds: 1));

    // strat & end pages
    final startIndex = page * maxPageSites;
    if (startIndex >= _diaryData.length) return [];

    final endIndex = startIndex + maxPageSites;
    return _diaryData.sublist(startIndex, endIndex.clamp(0, _diaryData.length));
  }

  @override
  Future<void> editDiaryEntry(DiaryEntry diaryEntry) async {
    await Future.delayed(Duration(microseconds: 100));
    final index =
        _diaryData.indexWhere((entry) => entry.date == diaryEntry.date);
    if (index != -1) {
      _diaryData[index] = diaryEntry;
    }
  }

  @override
  Future<void> deleteDiaryEntry(DiaryEntry diaryEntry) async {
    await Future.delayed(Duration(milliseconds: 100));
    _diaryData.removeWhere((entry) => entry.date == diaryEntry.date);
  }

  @override
  Future<DiaryEntry> showDiaryEntry(DiaryEntry diaryEntry) async {
    return diaryEntry;
  }

  // User
  @override
  Future<void> createUser(AppUser user) async {}
  @override
  Future<void> editUser(AppUser user) async {}
  @override
  Future<void> deleteUser(AppUser user) async {}

  // Appointment
  @override
  Future<void> createAppointment(Appointment appointment) async {}
  @override
  Future<Appointment> showAppointment(Appointment appointment) async {
    return appointment;
  }

  @override
  Future<void> editAppointment(Appointment appointment) async {}
  @override
  Future<void> deleteAppointment(Appointment appointment) async {}

  // Document
  @override
  Future<void> addDocument(Document document) async {
    await Future.delayed(Duration(microseconds: 100));
    _documentsData.add(document);
  }

  @override
  Future<List<Document>> getDocuments() async {
    await Future.delayed(Duration(milliseconds: 200));
    return List.from(_documentsData);
  }

  @override
  Future<void> editDocument(Document updatedDocument) async {
    await Future.delayed(Duration(microseconds: 100));
    final index =
        _documentsData.indexWhere((doc) => doc.id == updatedDocument.id);
    if (index != -1) {
      _documentsData[index] = updatedDocument;
    }
  }

  @override
  Future<void> deleteDocument(String documentId) async {
    await Future.delayed(Duration(milliseconds: 100));
    _documentsData.removeWhere((doc) => doc.id == documentId);
  }

  @override
  Future<void> clearAllDocuments() async {
    await Future.delayed(Duration(milliseconds: 100));
    _documentsData.clear();
  }

  // Settingsscreen
  @override
  Future<void> saveProfilePicture(String filePath) async {
    await Future.delayed(Duration(milliseconds: 100));
    _profilePicturePath = filePath;
  }

  @override
  Future<String?> getProfilePicture() async {
    await Future.delayed(Duration(milliseconds: 100));
    return _profilePicturePath;
  }
}
