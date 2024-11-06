import 'package:kroenchen_app/shared/repository/database_repository.dart';
import 'package:kroenchen_app/shared/models/appointment.dart';
import 'package:kroenchen_app/shared/models/diary.dart';
import 'package:kroenchen_app/shared/models/user.dart';

class MockDatabase implements DatabaseRepository {
  List<DiaryEntry> diaryData = [];
  List<User> userData = [];
  List<Appointment> appointmentData = [];

  @override
  Future<void> createAppointment(Appointment appointment) async {
    await Future.delayed(Duration(seconds: 2), () {
      Appointment newAppointment = Appointment(date: "date", name: "name");
      appointmentData.add(newAppointment);
    });
  }

  @override
  Future<void> createDiaryEntry(diaryEntry) async {
    await Future.delayed(Duration(seconds: 2), () {
      DiaryEntry newEntry = diaryEntry;
      diaryData.add(newEntry);
    });
  }

  // @override
  // Future<void> createUser(User user) async {
  //   await Future.delayed(Duration(seconds: 2));
  //   User newLoginUser = User("loginName", "password");
  //   userData.add(newLoginUser);
  // }

  @override
  Future<void> createUser(User user) async {
    await Future.delayed(Duration(seconds: 2));
    userData.add(User("loginName", "password"));
  }

  @override
  Future<void> deleteAppointment(Appointment appointment) async {}

  @override
  Future<void> deleteDiaryEntry(DiaryEntry diaryEntry) async {}

  @override
  Future<void> deleteUser(User user) async {}

  @override
  Future<void> editAppointment(Appointment appointment) async {}

  @override
  Future<void> editDiaryEntry(DiaryEntry diaryEntry) async {}

  @override
  Future<void> editUser(User user) async {}

  @override
  Future<Appointment> showAppointment(Appointment appointment) async {
    return appointment;
  }

  @override
  Future<DiaryEntry> showDiaryEntry(DiaryEntry diaryEntry) async {
    return diaryEntry;
  }
}
