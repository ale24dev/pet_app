import 'package:flutter/material.dart';

/// Themed tile that is usually displayed within a SettingSection.
/// The [leading],[title],[onTap] and [contentPadding] behave the same as [ListTile].
/// if [hasDetails] is true an arrow will be displayed trailing the tile.
class PetSettingsTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final VoidCallback? onTap;
  final bool hasDetails;
  final EdgeInsets? contentPadding;

  const PetSettingsTile({
    super.key,
    this.leading,
    this.title,
    this.onTap,
    this.hasDetails = false,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      horizontalTitleGap: 13,
      contentPadding: contentPadding ??
          const EdgeInsets.only(left: 20, right: 16) +
              const EdgeInsets.symmetric(vertical: 6),
      visualDensity: VisualDensity.compact,
      title: title,
      trailing:
          hasDetails ? const Icon(Icons.arrow_forward_ios, size: 19) : null,
      dense: true,
    );
  }
}
