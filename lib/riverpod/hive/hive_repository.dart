import 'package:p2p_test/repository/hive/hive_repository.dart';
import 'package:p2p_test/riverpod/hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'hive_repository.g.dart';

@riverpod
HiveRepository hiveRepository(Ref ref) {
  final hive = ref.watch(hiveProvider);
  return HiveRepository(hive);
}
