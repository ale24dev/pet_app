// Extensions and widgets that make mapping asyncValues to UI easier
import 'dart:developer';

import 'package:app_theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/resources/l10n/l10n.dart';
import 'package:pet_app/src/core/data/server_error.dart';

import 'keys.dart';

extension AsyncValueX<T> on AsyncValue<T> {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      final content = _errorMessage(error, context);
      showExceptionAlertDialog(
        context: context,
        title: content.title ?? context.l10n.error,
        exception: content.description,
      );
    }
  }

  void showSnackbarOnError(BuildContext context) {
    if (!isLoading && hasError) {
      final content = _errorMessage(error, context);

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.error,
            content: Text(content.title ?? context.l10n.error),
          ),
        );
    }
  }

  LocalizedServerErrorResponse _errorMessage(
    Object? error,
    BuildContext context,
  ) {
    // ignore: no_leading_underscores_for_local_identifiers
    final LocalizedServerErrorResponse _default = (
      description: '',
      title: error != null ? (error as dynamic).message : context.l10n.error
    );

    return _default;
  }
}

/// Generic function to show a platform-aware Material or Cupertino error dialog
Future<void> showExceptionAlertDialog({
  required BuildContext context,
  required String title,
  required dynamic exception,
}) =>
    showAlertDialog(
      context: context,
      key: K.errorDialog,
      title: title,
      //content: exception.toString(),
      defaultActionText: context.l10n.ok,
    );

/// Generic function to show a platform-aware Material or Cupertino dialog
Future<bool?> showAlertDialog({
  required BuildContext context,
  required String title,
  Key? key,
  String? content,
  String? cancelActionText,
  String? defaultActionText,
}) async {
  if (!Device.isIOS) {
    return showDialog(
      context: context,
      barrierDismissible: cancelActionText != null,
      builder: (context) => AlertDialog(
        key: key ?? K.dialog,
        title: Text(title),
        content: content != null ? Text(content) : null,
        actions: <Widget>[
          if (cancelActionText != null)
            TextButton(
              child: Text(cancelActionText),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          TextButton(
            child: Text(defaultActionText ?? context.l10n.ok),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }
  return showCupertinoDialog(
    context: context,
    barrierDismissible: cancelActionText != null,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: content != null ? Text(content) : null,
      actions: <Widget>[
        if (cancelActionText != null)
          CupertinoDialogAction(
            child: Text(cancelActionText),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        CupertinoDialogAction(
          child: Text(defaultActionText ?? context.l10n.ok),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    ),
  );
}

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
