import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:app_theme/app_theme.dart';
import 'package:go_router/go_router.dart';

// See https://croxx5f.hashnode.dev/adding-modal-routes-to-your-gorouter for more details.

/// A page that creates a material style [DialogRoute].
class DialogPage<T> extends Page<T> {
  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String? barrierLabel;
  final bool useSafeArea;
  final CapturedThemes? themes;
  final WidgetBuilder builder;

  const DialogPage({
    required this.builder,
    this.anchorPoint,
    this.barrierColor = Colors.black54,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.useSafeArea = true,
    this.themes,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
        context: context,
        settings: this,
        builder: builder,
        anchorPoint: anchorPoint,
        barrierColor: barrierColor,
        barrierDismissible: barrierDismissible,
        barrierLabel: barrierLabel,
        useSafeArea: useSafeArea,
        themes: themes,
      );
}

/// A page that creates a material style [ModalBottomSheetRoute].
class ModalBottomSheetPage<T> extends Page<T> {
  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String? barrierLabel;
  final bool useSafeArea;
  final CapturedThemes? themes;
  final bool isScrollControlled;
  final BoxConstraints? constraints;

  const ModalBottomSheetPage({
    required this.child,
    required this.isScrollControlled,
    this.anchorPoint,
    this.barrierColor = Colors.black54,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.useSafeArea = true,
    this.themes,
    this.constraints,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  /// The content to be shown in the [Route] created by this page.
  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        isScrollControlled: isScrollControlled,
        settings: this,
        builder: (context) => child,
        anchorPoint: anchorPoint,
        modalBarrierColor: barrierColor,
        isDismissible: barrierDismissible,
        barrierLabel: barrierLabel,
        useSafeArea: useSafeArea,
        constraints: constraints ?? BoxConstraints.loose(Size.fromHeight(context.heightPct(.5))),
        capturedThemes: themes,
      );
}

/// Adaptive route that uses cupertino pages on iOS and macos, no transitions on web and material on the rest of the
/// platforms.
Page<T> adaptivePageRoute<T>({
  required LocalKey key,
  required Widget child,
  bool maintainState = true,
  bool fullscreenDialog = false,
  bool allowSnapshotting = true,
  String? name,
  String? title,
  Object? arguments,
  String? restorationId,
}) {
  final iosPlatforms = [TargetPlatform.iOS, TargetPlatform.macOS];
  if (iosPlatforms.contains(defaultTargetPlatform)) {
    return CupertinoPage<T>(
      key: key,
      child: child,
      name: name,
      title: title,
      allowSnapshotting: allowSnapshotting,
      arguments: arguments,
      fullscreenDialog: fullscreenDialog,
      maintainState: maintainState,
      restorationId: restorationId,
    );
  }
  if (kIsWeb) {
    return NoTransitionPage(
      child: child,
      restorationId: restorationId,
      arguments: arguments,
      name: name,
      key: key,
    );
  }
  return MaterialPage<T>(
    key: key,
    child: child,
    name: name,
    allowSnapshotting: allowSnapshotting,
    arguments: arguments,
    fullscreenDialog: fullscreenDialog,
    maintainState: maintainState,
    restorationId: restorationId,
  );
}

Page<void> slideTransition({
  required LocalKey key,
  required Widget child,
  bool maintainState = true,
  bool fullscreenDialog = false,
  String? name,
  Object? arguments,
  String? restorationId,
  Offset offset = const Offset(-1, 0),
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    name: name,
    arguments: arguments,
    fullscreenDialog: fullscreenDialog,
    maintainState: maintainState,
    restorationId: restorationId,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: offset,
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeIn)),
      ),
      child: child,
    ),
  );
}
