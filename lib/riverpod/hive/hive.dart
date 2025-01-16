import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'hive.g.dart';

@riverpod
HiveInterface hive(Ref ref) => Hive;
