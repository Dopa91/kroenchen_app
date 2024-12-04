import 'package:kroenchen_app/shared/models/appointment.dart';
import 'package:kroenchen_app/shared/models/diary.dart';
import 'package:kroenchen_app/shared/models/user.dart';

abstract class DatabaseRepository {
  Future<void> createUser(User user);
  Future<void> editUser(User user);
  Future<void> deleteUser(User user);

  Future<void> createDiaryEntry(DiaryEntry diaryEntry);
  Future<DiaryEntry> showDiaryEntry(DiaryEntry diaryEntry);
  Future<void> editDiaryEntry(DiaryEntry diaryEntry);
  Future<void> deleteDiaryEntry(DiaryEntry diaryEntry);
  Future<List<DiaryEntry>> getDiaryEntries();

  Future<void> createAppointment(Appointment appointment);
  Future<Appointment> showAppointment(Appointment appointment);
  Future<void> editAppointment(Appointment appointment);
  Future<void> deleteAppointment(Appointment appointment);
}
