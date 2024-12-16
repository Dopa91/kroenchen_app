import 'package:kroenchen_app/shared/models/user.dart' as app_models;

abstract class AuthRepository {
  Stream<app_models.AppUser?> get authStateChanges;

  app_models.AppUser? get currentUser;

  Future<app_models.AppUser?> signInWithEmailAndPassword(
      String email, String password);
  Future<app_models.AppUser?> createUserWithEmailAndPassword(
      String email, String password);

  Future<app_models.AppUser?> signInWithGoogle();

  Future<void> signOut();
}
