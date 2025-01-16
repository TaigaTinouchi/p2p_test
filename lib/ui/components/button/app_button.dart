import 'dart:async';

import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    required this.onPressed,
    this.text,
    this.child,
  }) {
    if (text != null && child != null) {
      throw ArgumentError('text and child cannot be used together');
    }
  }

  final FutureOr<void> Function() onPressed;
  final String? text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text ?? ''),
    );
  }
}
