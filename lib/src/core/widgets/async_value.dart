import 'dart:developer';

import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Helps mapping [value] to a Widget, it provides a default loading and error UI, to strive for consistency in the app
class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({super.key, required this.value, required this.data});

  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: 250.ms,
      child: value.when(
        data: data,
        error: (e, st) {
          log(e.toString(), stackTrace: st);
          return Center(child: ErrorWidget(e));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}