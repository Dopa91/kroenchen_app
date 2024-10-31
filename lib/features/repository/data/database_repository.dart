import 'package:kroenchen_app/features/repository/models/appointment.dart';
import 'package:kroenchen_app/features/repository/models/diary.dart';
import 'package:kroenchen_app/features/repository/models/user.dart';

abstract class DatabaseRepository {
// Einen neuen Benutzer hinzufügen (createUser)
  void createUser(User user);
// Bestehende Benutzerdaten bearbeiten ( editUser)
  void editUser(User user);
// Benutzerdaten löschen (deleteUser)
  void deleteUser(User user);

// Einen neuen Tagebucheintrag erstellen (createDiaryEntry)
  void createDiaryEntry(DiaryEntry diaryEntry);
// Den Tagebucheintrag anzeigen lassen (showDiaryEntry)
  DiaryEntry showDiaryEntry(DiaryEntry diaryEntry);
// Tagebucheintrag bearbeiten ( editDiaryEntry)
  void editDiaryEntry(DiaryEntry diaryEntry);
// Tagebucheintrag löschen (deleteDiaryEntry)
  void deleteDiaryEntry(DiaryEntry diaryEntry);

// Einen neuen Termineintrag erstellen (createAppointment)
  void createAppointment(Appointment appointment);
// Den erstellten Termin  anzeigen lassen (showAppointment)
  Appointment showAppointment(Appointment appointment);
// Termine bearbeiten ( editAppointment)
  void editAppointment(Appointment appointment);
// Termin löschen (deleteAppointment)
  void deleteAppointment(Appointment appointment);
}
