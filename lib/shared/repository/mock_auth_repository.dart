import 'dart:async';
import 'package:kroenchen_app/shared/models/user.dart' as app_models;
import 'package:kroenchen_app/shared/repository/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  app_models.AppUser? actualUser;
  final controller = StreamController<app_models.AppUser?>();

  MockAuthRepository() {
    actualUser = null;
    controller.onListen = () {
      controller.add(actualUser);
    };
  }

  @override
  Stream<app_models.AppUser?> get authStateChanges => controller.stream;

  @override
  app_models.AppUser? get currentUser => actualUser;

  @override
  Future<app_models.AppUser?> signInWithEmailAndPassword(
      String email, String password) async {
    actualUser = app_models.AppUser(userId: "bober", email: email);
    controller.add(actualUser);
    return actualUser;
  }

  @override
  Future<app_models.AppUser?> createUserWithEmailAndPassword(
      String email, String password) async {
    actualUser = app_models.AppUser(userId: 'bober', email: email);
    controller.add(actualUser);
    return actualUser;
  }

  @override
  Future<void> signOut() async {
    actualUser = null;
    controller.add(actualUser);
  }

  @override
  Future<app_models.AppUser?> signInWithGoogle() async {
    actualUser = app_models.AppUser(userId: 'bober', email: 'bober@bober.com');
    controller.add(actualUser);
    return actualUser;
  }
}
