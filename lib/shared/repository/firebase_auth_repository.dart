import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kroenchen_app/shared/models/user.dart' as app_models;
import 'package:kroenchen_app/shared/repository/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  final firebase_auth.FirebaseAuth firebaseAuth =
      firebase_auth.FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Stream<app_models.AppUser?> get authStateChanges {
    return firebaseAuth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) {
        return null;
      } else {
        return app_models.AppUser(
          userId: firebaseUser.uid,
          email: firebaseUser.email,
        );
      }
    });
  }

  @override
  app_models.AppUser? get currentUser {
    final user = firebaseAuth.currentUser;
    if (user == null) return null;
    return app_models.AppUser(userId: user.uid, email: user.email);
  }

  @override
  Future<app_models.AppUser?> signInWithEmailAndPassword(
      String email, String password) async {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    final user = credential.user;
    if (user == null) return null;
    return app_models.AppUser(userId: user.uid, email: user.email);
  }

  @override
  Future<app_models.AppUser?> createUserWithEmailAndPassword(
      String email, String password) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    final user = credential.user;
    if (user == null) return null;
    return app_models.AppUser(userId: user.uid, email: user.email);
  }

  @override
  Future<app_models.AppUser?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = firebase_auth.GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final authResult = await firebaseAuth.signInWithCredential(credential);
    final user = authResult.user;
    if (user == null) return null;

    return app_models.AppUser(userId: user.uid, email: user.email);
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
