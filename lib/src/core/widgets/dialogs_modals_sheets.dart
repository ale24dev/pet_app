import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

/// Shows a [DraggableScrollableSheet] with [builder] as content.
/// The scrollController passed to the builder MUST be assigned to the scrollable eg: listview.
/// It automatically expands and contracts when the keyboard is shown/dismissed.
Future<void> showDraggableResizableSheet<T>({
  required BuildContext context,
  required ScrollableWidgetBuilder builder,
  double initialChildSize = .5,
  double minChildSize = .3,
  double maxChildSize = 1,
  bool shrinkOnKeyboardDismissal = true,
  double keyboardDismissedSize = .8,
}) async {
  final sheetController = DraggableScrollableController();
  var lastFrameKeyboardShown = false;

  return showModalBottomSheet<T>(
    showDragHandle: true,
    isScrollControlled: true,
    context: context,
    builder: (_) => DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      expand: false,
      controller: sheetController,
      builder: (BuildContext context, ScrollController scrollController) {
        if (context.isKeyboardVisible) {
          sheetController.animateTo(1, duration: 150.ms, curve: Curves.easeInOut);
          lastFrameKeyboardShown = true;
        } else if (shrinkOnKeyboardDismissal && !context.isKeyboardVisible && lastFrameKeyboardShown) {
          sheetController.animateTo(keyboardDismissedSize, duration: 450.ms, curve: Curves.easeInOut);

          lastFrameKeyboardShown = false;
        }
        return Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          body: builder(context, scrollController),
        );
      },
    ),
  ).then((value) {
    sheetController.dispose();
  });
}
