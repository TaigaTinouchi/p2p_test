import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth.dart';

part 'is_sign_in.g.dart';

@riverpod
Stream<User?> isSignIn(Ref ref) => ref.watch(fbAuthProvider).authStateChanges();
