import 'package:kroenchen_app/shared/models/appointment.dart';
import 'package:kroenchen_app/shared/models/diary.dart';
import 'package:kroenchen_app/shared/models/user.dart';

abstract class DatabaseRepository {
// Einen neuen Benutzer hinzufügen (createUser)
  Future<void> createUser(User user);
// Bestehende Benutzerdaten bearbeiten ( editUser)
  Future<void> editUser(User user);
// Benutzerdaten löschen (deleteUser)
  Future<void> deleteUser(User user);

// Einen neuen Tagebucheintrag erstellen (createDiaryEntry)
  Future<void> createDiaryEntry(DiaryEntry diaryEntry);
// Den Tagebucheintrag anzeigen lassen (showDiaryEntry)
  Future<DiaryEntry> showDiaryEntry(DiaryEntry diaryEntry);
// Tagebucheintrag bearbeiten ( editDiaryEntry)
  Future<void> editDiaryEntry(DiaryEntry diaryEntry);
// Tagebucheintrag löschen (deleteDiaryEntry)
  Future<void> deleteDiaryEntry(DiaryEntry diaryEntry);

// Einen neuen Termineintrag erstellen (createAppointment)
  Future<void> createAppointment(Appointment appointment);
// Den erstellten Termin  anzeigen lassen (showAppointment)
  Future<Appointment> showAppointment(Appointment appointment);
// Termine bearbeiten ( editAppointment)
  Future<void> editAppointment(Appointment appointment);
// Termin löschen (deleteAppointment)
  Future<void> deleteAppointment(Appointment appointment);
}
