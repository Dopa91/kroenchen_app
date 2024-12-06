import 'dart:convert';
import 'package:kroenchen_app/shared/repository/database_repository.dart';
import 'package:kroenchen_app/shared/models/appointment.dart';
import 'package:kroenchen_app/shared/models/diary.dart';
import 'package:kroenchen_app/shared/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDatabase implements DatabaseRepository {
  static const String diaryData = 'diary_entries';

// DiaryEntry
  @override
  Future<void> createDiaryEntry(DiaryEntry diaryEntry) async {
    final prefs = await SharedPreferences.getInstance();
    final currentEntries = await getDiaryEntries();
    currentEntries.add(diaryEntry);

    final jsonList = currentEntries.map((entry) => entry.toJson()).toList();
    await prefs.setString(diaryData, jsonEncode(jsonList));
  }

  @override
  Future<List<DiaryEntry>> getDiaryEntries() async {
    await Future.delayed(Duration(seconds: 1));
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(diaryData);

    if (jsonString == null) return [];
    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList.map((entry) => DiaryEntry.fromJson(entry)).toList();
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
  Future<void> createUser(User user) async {}
  @override
  Future<void> editUser(User user) async {}
  @override
  Future<void> deleteUser(User user) async {}

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
}
