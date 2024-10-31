import 'package:kroenchen_app/features/repository/data/database_repository.dart';
import 'package:kroenchen_app/features/repository/models/appointment.dart';
import 'package:kroenchen_app/features/repository/models/diary.dart';
import 'package:kroenchen_app/features/repository/models/user.dart';

class MockDatabase implements DatabaseRepository {
  List<DiaryEntry> diaryData = [];
  List<User> userData = [];
  List<Appointment> appointmentData = [];

  @override
  void createAppointment(Appointment appointment) {
    Appointment newAppointment = Appointment(date: "date", name: "name");
    appointmentData.add(newAppointment);
  }

  @override
  void createDiaryEntry(diaryEntry) {
    DiaryEntry newEntry = diaryEntry;
    diaryData.add(newEntry);
  }

  @override
  void createUser(User user) {
    User newLoginUser = User("loginName", "password");
    userData.add(newLoginUser);
  }

  @override
  void deleteAppointment(Appointment appointment) {}

  @override
  void deleteDiaryEntry(DiaryEntry diaryEntry) {}

  @override
  void deleteUser(User user) {}

  @override
  void editAppointment(Appointment appointment) {}

  @override
  void editDiaryEntry(DiaryEntry diaryEntry) {}

  @override
  void editUser(User user) {}

  @override
  Appointment showAppointment(Appointment appointment) {
    return appointment;
  }

  @override
  DiaryEntry showDiaryEntry(DiaryEntry diaryEntry) {
    return diaryEntry;
  }
}
