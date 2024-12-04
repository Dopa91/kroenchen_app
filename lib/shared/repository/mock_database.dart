import 'package:kroenchen_app/shared/repository/database_repository.dart';
import 'package:kroenchen_app/shared/models/appointment.dart';
import 'package:kroenchen_app/shared/models/diary.dart';
import 'package:kroenchen_app/shared/models/user.dart';

class MockDatabase implements DatabaseRepository {
  final List<DiaryEntry> _diaryData = [];

  @override
  Future<void> createDiaryEntry(DiaryEntry diaryEntry) async {
    await Future.delayed(Duration(microseconds: 100));
    _diaryData.add(diaryEntry);
  }

  @override
  Future<List<DiaryEntry>> getDiaryEntries() async {
    await Future.delayed(Duration(seconds: 3));
    return List.from(_diaryData);
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

  // Platzhalter-Methoden
  @override
  Future<void> createUser(User user) async {}
  @override
  Future<void> editUser(User user) async {}
  @override
  Future<void> deleteUser(User user) async {}
  @override
  Future<DiaryEntry> showDiaryEntry(DiaryEntry diaryEntry) async {
    return diaryEntry;
  }

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
