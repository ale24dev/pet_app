import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const fontFamily = 'Poppins';
  static const secondaryFontFamily = 'Montserrat';

  // Custom text theme overriding material 3 properties.
  // This class has few implemented styles and by default is not applied to the theme.
  textTheme(TextTheme theme) => theme.copyWith(
        titleMedium: switchListTile,
      );

  /// Base Text Style
  static const _default = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );

  /// Display Text Style
  TextStyle get display => _default.copyWith(
        fontSize: 57,
        fontWeight: FontWeight.bold,
        height: 1.12,
        letterSpacing: -0.25,
      );

  TextStyle get onboardTitle => _default.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      letterSpacing: -.2,
      height: 1.15,
      fontFamily: fontFamily);

  TextStyle get onboardSubTitle => _default.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w300,
        color: AppColor.onboardText,
        letterSpacing: 1.07,
        height: 1.3,
      );

  TextStyle get appBarTitle => _default.copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: AppColor.headerText,
        letterSpacing: 0,
        height: 1.3,
      );

  TextStyle get frostButton => const TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      );

  TextStyle get searchBar => labelMedium;

  TextStyle get labelMedium => _default.copyWith(
        fontSize: 11,
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: AppColor.headerText,
      );

  TextStyle get settings => _default.copyWith(
        fontSize: 11,
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: AppColor.settingsTitleText,
      );

  TextStyle get switchListTile => _default.copyWith(
        fontSize: 14,
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: AppColor.headerText,
      );

  TextStyle get profileName => _default.copyWith(
        fontSize: 19,
        fontWeight: FontWeight.w600,
        color: AppColor.headerText,
        letterSpacing: -.6,
      );

  TextStyle get profileEmail => _default.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColor.headerText,
        letterSpacing: -.6,
      );

  TextStyle get categoryCard => _default.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColor.headerText,
        letterSpacing: -.6,
      );

  TextStyle get sectionTitle => _default.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColor.headerText,
        letterSpacing: -.6,
      );

  TextStyle get ratingText => _default.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: AppColor.headerText,
        letterSpacing: -.6,
      );

  TextStyle productCardFinalPrice(BuildContext context) => _default.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).primaryColor,
        letterSpacing: -.6,
      );

  TextStyle get productCardPrice => _default.copyWith(
        fontSize: 9,
        fontWeight: FontWeight.w400,
        color: AppColor.switchTrackUnfocused,
        decoration: TextDecoration.lineThrough,
        letterSpacing: -.6,
      );

  TextStyle get productCardTitle => _default.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColor.bodyText,
        letterSpacing: -.6,
      );

  TextStyle get seeAll => _default.copyWith(
        fontSize: 14,
        letterSpacing: 0,
        fontWeight: FontWeight.w500,
        color: AppColor.headerText,
      );

  TextStyle get primaryButtonLeading => _default.copyWith(
      fontSize: 15,
      letterSpacing: -.2,
      fontWeight: FontWeight.w500,
      height: .9);

  TextStyle get primaryButtonTrailing => _default.copyWith(
        fontSize: 14,
        letterSpacing: 0,
        fontWeight: FontWeight.w500,
      );

  TextStyle get deliveryText => _default.copyWith(
        fontSize: 15,
        letterSpacing: 0,
        color: AppColor.deliveryText,
        fontWeight: FontWeight.w400,
      );

  TextStyle get popupName => _default.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColor.headerText,
        letterSpacing: -.6,
      );

  TextStyle get popupEmail => _default.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColor.headerText,
        letterSpacing: -.6,
      );

  TextStyle get productDetailsTitle => _default.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColor.bodyText,
        letterSpacing: -.6,
      );

  TextStyle get productDetailsBody => _default.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColor.headerText,
        letterSpacing: -.6,
      );
  TextStyle get productReviewTitle => _default.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColor.bodyText,
        letterSpacing: -.6,
      );
  TextStyle get productReviewAmount => _default.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w300,
        color: AppColor.headerText,
        letterSpacing: -.6,
      );

  TextStyle get body =>
      _default.copyWith(fontSize: 14, fontWeight: FontWeight.w400);

  TextStyle get title =>
      _default.copyWith(fontSize: 28, fontWeight: FontWeight.w400);

  TextStyle get label =>
      _default.copyWith(fontSize: 20, fontWeight: FontWeight.w400);

  TextStyle headline =
      _default.copyWith(fontSize: 35, fontWeight: FontWeight.w700);
}
