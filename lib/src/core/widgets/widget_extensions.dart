import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/resources/l10n/l10n.dart';

extension WidgetX on Widget {
  Widget animatedSwitch({bool sliver = false}) {
    // if (sliver) return SliverAnimatedSwitcher(duration: 250.ms, child: this);
    return AnimatedSwitcher(duration: 250.ms, child: this);
  }

  Widget padContent(BuildContext context, {bool sliver = false}) {
    if (sliver) {
      return SliverPadding(
          padding: context.responsiveContentPadding, sliver: this);
    }
    return Padding(padding: context.responsiveContentPadding, child: this);
  }

  /// A sliver that contains a single box widget.
  Widget toBox() => SliverToBoxAdapter(child: this);
}

extension ContextX on BuildContext {
  void showSuccessSnackBar({String? text, Color? color}) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(
          text ?? l10n.success,
          style: AppTextStyle().snackBar,
        ),
        backgroundColor: color ?? Theme.of(this).primaryColor,
      ));
  }
}
