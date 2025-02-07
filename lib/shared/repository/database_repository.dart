import 'package:kroenchen_app/shared/models/appointment.dart';
import 'package:kroenchen_app/shared/models/diary.dart';
import 'package:kroenchen_app/shared/models/user.dart';
import 'package:kroenchen_app/shared/models/document.dart';

abstract class DatabaseRepository {
  // User
  Future<void> createUser(AppUser user);
  Future<void> editUser(AppUser user);
  Future<void> deleteUser(AppUser user);

  // Diary
  Future<void> createDiaryEntry(DiaryEntry diaryEntry);
  Future<DiaryEntry> showDiaryEntry(DiaryEntry diaryEntry);
  Future<void> editDiaryEntry(DiaryEntry diaryEntry);
  Future<void> deleteDiaryEntry(DiaryEntry diaryEntry);
  Future<List<DiaryEntry>> getDiaryEntries(
      {required int page, required int maxPageSites});

  // Appointment
  Future<void> createAppointment(Appointment appointment);
  Future<Appointment> showAppointment(Appointment appointment);
  Future<void> editAppointment(Appointment appointment);
  Future<void> deleteAppointment(Appointment appointment);

  // Document
  Future<void> addDocument(Document document);
  Future<List<Document>> getDocuments();
  Future<void> editDocument(Document updatedDocument);
  Future<void> deleteDocument(String documentId);
  Future<void> clearAllDocuments();

  // Profile Picture
  Future<void> saveProfilePicture(String filePath);
  Future<String?> getProfilePicture();
}
