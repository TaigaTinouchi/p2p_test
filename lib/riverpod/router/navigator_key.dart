import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'navigator_key.g.dart';

@riverpod
GlobalKey<NavigatorState> navigatorKey(Ref ref) => GlobalKey<NavigatorState>();
