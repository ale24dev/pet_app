import 'package:flutter/material.dart';

/// Used to provide a relative position position to a widget.
/// The position is strictly below the widget, starting at the bottom right
/// Sample:
///       ╭―――――╮
///       │     │ = ORIGIN
///       ╰―――――╯
/// ╭―――――――――――╮
/// │           │ = Relative position return by this method. Ignore tha vertical padding between boxes
/// │           │
/// │           │
/// ╰―――――――――――╯
///
RelativeRect rectFromContext(BuildContext context) {
  final overlay = Overlay.of(context).context.findRenderObject() as RenderBox?;

  final element = context.findRenderObject() as RenderBox?;

  if (overlay == null || element == null) {
    throw Exception('Unable to locate parent render box. Consider wrapping the calling widget with a builder');
  }

  return RelativeRect.fromRect(
    Rect.fromPoints(
      element.localToGlobal(Offset(0, element.size.height), ancestor: overlay),
      element.localToGlobal(element.size.bottomRight(Offset.zero), ancestor: overlay),
    ),
    Offset.zero & overlay.size,
  );
}
