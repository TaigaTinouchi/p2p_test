import 'package:flutter/material.dart' as material;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

@riverpod
class ThemeMode extends _$ThemeMode {
  @override
  material.ThemeMode build() {
    return material.ThemeMode.light;
  }

  bool get isDarkMode => state == material.ThemeMode.dark;

  void toggle() {
    state = state == material.ThemeMode.light ? material.ThemeMode.dark : material.ThemeMode.light;
  }
}
