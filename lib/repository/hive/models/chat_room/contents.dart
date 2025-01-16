import 'package:hive_ce_flutter/hive_flutter.dart';

class Contents extends HiveObject {
  Contents({
    required this.id,
    required this.type,
    required this.content,
    required this.timestamp,
  });

  String id;
  String type;
  Map<String, dynamic> content;
  DateTime timestamp;
}
