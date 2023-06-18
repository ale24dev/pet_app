import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Show a generic button with a [child] and [onTap]
///if [textStyle] is null then style will be style body by default
///
///if [buttonStyle] is null then style have a primary color

class PetAsyncGenericButton extends StatelessWidget {
  const PetAsyncGenericButton({
    super.key,
    required this.onTap,
    this.height = 48,
    this.textStyle,
    this.buttonStyle,
    required this.child,
  });

  final VoidCallback? onTap;

  final Widget child;
  final TextStyle? textStyle;

  final ButtonStyle? buttonStyle;

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: buttonStyle ?? ElevatedButton.styleFrom(backgroundColor: AppColor.primary),
        child: DefaultTextStyle(style: textStyle ?? AppTextStyle().body, child: child),
      ),
    );
  }
}
/// A custom button that given an [asyncValue] displays a progress [loadingChild] an AppProgressIndicator by default.
/// animates between states and disables the [onTap] while loading.
class AsyncGenericButton<T> extends PetAsyncGenericButton {
  const AsyncGenericButton( {
    super.key,
    required super.onTap,
    this.height = 48,
    this.textStyle,
    this.buttonStyle,
    required super.child,
    required this.asyncValue,
    this.width,
    this.loadingChild = const CircularProgressIndicator(),
  });

  final Widget loadingChild;
  @override
  final TextStyle? textStyle;

  @override
  final ButtonStyle? buttonStyle;
  final AsyncValue<T> asyncValue;
  @override
  final double height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final content = asyncValue.maybeMap(
      orElse: () => child,
      loading: (loading) => const FittedBox(
        child: Padding(padding: EdgeInsets.all(12), child: CircularProgressIndicator()),
      ),
    );

    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: asyncValue.isLoading ? null : onTap,
        style: buttonStyle ?? ElevatedButton.styleFrom(backgroundColor: AppColor.primary),
        child: DefaultTextStyle(
            style: textStyle ?? AppTextStyle().body, child: AnimatedSwitcher(duration: 250.ms, child: content)),
      ),
    );
  }
}
