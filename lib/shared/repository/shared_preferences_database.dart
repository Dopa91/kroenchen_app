import 'dart:convert';
import 'package:kroenchen_app/shared/models/document.dart';
import 'package:kroenchen_app/shared/repository/database_repository.dart';
import 'package:kroenchen_app/shared/models/appointment.dart';
import 'package:kroenchen_app/shared/models/diary.dart';
import 'package:kroenchen_app/shared/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDatabase implements DatabaseRepository {
  static const String diaryData = 'diary_entries';
  static const String documentKey = 'documents';
  static const String profilePictureKey = 'profile_picture';
  static const String profileNameKey = 'profile_name';

  // DiaryEntry
  @override
  Future<void> createDiaryEntry(DiaryEntry diaryEntry) async {
    final prefs = await SharedPreferences.getInstance();
    final currentEntries = await getDiaryEntries();
    currentEntries.add(diaryEntry);

    final jsonList = currentEntries.map((entry) => entry.toJson()).toList();
    await prefs.setString(diaryData, jsonEncode(jsonList));
  }
// backup ( Testing with max Pages)
  // @override
  // Future<List<DiaryEntry>> getDiaryEntries() async {
  //   await Future.delayed(Duration(seconds: 1));
  //   final prefs = await SharedPreferences.getInstance();
  //   final jsonString = prefs.getString(diaryData);

  //   if (jsonString == null) return [];
  //   final List<dynamic> jsonList = jsonDecode(jsonString);

  //   return jsonList.map((entry) => DiaryEntry.fromJson(entry)).toList();
  // }
  @override
  Future<List<DiaryEntry>> getDiaryEntries(
      {int page = 0, int maxPageSites = 420}) async {
    await Future.delayed(Duration(seconds: 1));
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(diaryData);
    if (jsonString == null) return [];

    final List<dynamic> jsonList = jsonDecode(jsonString);
    final allEntries =
        jsonList.map((entry) => DiaryEntry.fromJson(entry)).toList();

    // Paginierung
    final startIndex = page * maxPageSites;
    if (startIndex >= allEntries.length) return [];

    final endIndex = startIndex + maxPageSites;
    return allEntries.sublist(startIndex, endIndex.clamp(0, allEntries.length));
  }

  @override
  Future<void> editDiaryEntry(DiaryEntry diaryEntry) async {
    final prefs = await SharedPreferences.getInstance();
    final currentEntries = await getDiaryEntries();

    final index =
        currentEntries.indexWhere((entry) => entry.date == diaryEntry.date);
    if (index != -1) {
      currentEntries[index] = diaryEntry;

      final jsonList = currentEntries.map((entry) => entry.toJson()).toList();
      await prefs.setString(diaryData, jsonEncode(jsonList));
    }
  }

  @override
  Future<void> deleteDiaryEntry(DiaryEntry diaryEntry) async {
    final prefs = await SharedPreferences.getInstance();
    final currentEntries = await getDiaryEntries();

    currentEntries.removeWhere((entry) => entry.date == diaryEntry.date);

    final jsonList = currentEntries.map((entry) => entry.toJson()).toList();
    await prefs.setString(diaryData, jsonEncode(jsonList));
  }

  @override
  Future<DiaryEntry> showDiaryEntry(DiaryEntry diaryEntry) async {
    final entries = await getDiaryEntries();
    return entries.firstWhere((entry) => entry.date == diaryEntry.date);
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
    final prefs = await SharedPreferences.getInstance();
    final currentDocuments = await getDocuments();

    currentDocuments.add(document);
    final jsonList = currentDocuments.map((doc) => doc.toJson()).toList();
    await prefs.setString(documentKey, jsonEncode(jsonList));
  }

  @override
  Future<List<Document>> getDocuments() async {
    await Future.delayed(Duration(seconds: 1));
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(documentKey);
    if (jsonString == null) return [];

    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((doc) => Document.fromJson(doc)).toList();
  }

  @override
  Future<void> deleteDocument(String documentId) async {
    final prefs = await SharedPreferences.getInstance();
    final currentDocuments = await getDocuments();

    currentDocuments.removeWhere((doc) => doc.id == documentId);
    final jsonList = currentDocuments.map((doc) => doc.toJson()).toList();
    await prefs.setString(documentKey, jsonEncode(jsonList));
  }

  @override
  Future<void> editDocument(Document updatedDocument) async {
    final prefs = await SharedPreferences.getInstance();
    final currentDocuments = await getDocuments();

    final index =
        currentDocuments.indexWhere((doc) => doc.id == updatedDocument.id);
    if (index != -1) {
      currentDocuments[index] = updatedDocument;

      final jsonList = currentDocuments.map((doc) => doc.toJson()).toList();
      await prefs.setString(documentKey, jsonEncode(jsonList));
    }
  }

  @override
  Future<void> clearAllDocuments() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(documentKey);
  }

  //SettingsScreen
  @override
  Future<void> saveProfilePicture(String filePath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(profilePictureKey, filePath);
  }

  @override
  Future<String?> getProfilePicture() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(profilePictureKey);
  }

// Profilname speichern
  @override
  Future<void> saveProfileName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(profileNameKey, name);
  }

// Profilname abrufen
  @override
  Future<String?> getProfileName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(profileNameKey);
  }
}
