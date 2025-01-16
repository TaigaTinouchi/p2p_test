import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'app.g.dart';

@riverpod
Future<FirebaseApp> fbApp(Ref ref) async => await Firebase.initializeApp();
