import 'package:hive_ce_flutter/hive_flutter.dart';

class HiveRepository {
  HiveRepository(this.hive);
  final HiveInterface hive;

  Future<void> initHive() async {
    await hive.initFlutter();
  }
}
