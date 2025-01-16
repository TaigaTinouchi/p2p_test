import 'dart:ui';

export 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:p2p_test/riverpod/firebase/firebase_app/app.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

@riverpod
class FbAuth extends _$FbAuth {
  @override
  FirebaseAuth build() {
    final app = ref.watch(fbAppProvider);
    return app.when(
      data: (value) => FirebaseAuth.instanceFor(app: value),
      loading: () => throw UnimplementedError(),
      error: (error, stackTrace) => throw error,
    );
  }

  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
    required VoidCallback onSuccsess,
    required VoidCallback onInvalidEmail,
    required VoidCallback onEmailAlreadyInUse,
    required VoidCallback onFail,
  }) async {
    try {
      await state.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // authのauthStateChanges()でログイン状態を監視しているため、
      // ユーザーが登録されると自動的にログイン状態になる
      onSuccsess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        onInvalidEmail();
      } else if (e.code == 'email-already-in-use') {
        onEmailAlreadyInUse();
      }
    } catch (e) {
      onFail();
    }
  }

  // Sign in with email and password
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    required VoidCallback onSuccsess,
    required VoidCallback onCatchAuthException,
    required VoidCallback onFail,
  }) async {
    try {
      await state.signInWithEmailAndPassword(email: email, password: password);
      // authのauthStateChanges()でログイン状態を監視しているため、
      // ユーザーが登録されると自動的にログイン状態になる
      onSuccsess();
    } on FirebaseAuthException catch (_) {
      onCatchAuthException();
    } catch (e) {
      onFail();
    }
  }

  // Sign out
  Future<void> signOut() async {
    await state.signOut();
  }

  // User
  String? get uid => state.currentUser?.uid;
}
