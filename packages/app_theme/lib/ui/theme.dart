import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'typography.dart';

class AppTheme {
  AppTheme();

  // Made for FlexColorScheme version 7.0.0+.
  // Refer to https://docs.flexcolorscheme.com/ for documentation
  ThemeData get light => _postProcess(FlexThemeData.light(
        colors: _appFlexScheme.light,
        surfaceTint: Colors.white,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        onPrimary: Colors.white,
        scaffoldBackground: AppColor.scaffold,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,

          blendOnColors: false,
          useM2StyleDividerInM3: true,
          defaultRadius: 10,
          drawerBackgroundSchemeColor: SchemeColor.primaryContainer,

          ///
          outlinedButtonBorderWidth: 1,
          outlinedButtonOutlineSchemeColor: SchemeColor.primary,
          elevatedButtonRadius: 50,

          ///
          inputDecoratorFillColor: AppColor.container,
          inputDecoratorBorderWidth: 1,
          inputDecoratorFocusedBorderWidth: 1,

          ///
          cardElevation: 15,
          fabSchemeColor: SchemeColor.primary,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: false,
        fontFamily: AppTextStyle.fontFamily,
      ));

  ThemeData get dark => _postProcess(FlexThemeData.dark(
        colors: _appFlexScheme.dark,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        onPrimary: Colors.white,
        surfaceTint: AppColor.containerDark,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useM2StyleDividerInM3: true,
          defaultRadius: 10,
          drawerBackgroundSchemeColor: SchemeColor.primaryContainer,

          ///
          outlinedButtonBorderWidth: 1,
          outlinedButtonOutlineSchemeColor: SchemeColor.primary,

          ///
          inputDecoratorFillColor: AppColor.container,
          inputDecoratorBorderWidth: 1,
          inputDecoratorFocusedBorderWidth: 1,

          ///
          cardElevation: 15,
          fabSchemeColor: SchemeColor.primary,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: AppTextStyle.fontFamily,
      ));

  // Some tweaks needed after the theme generation
  ThemeData _postProcess(ThemeData theme) {
    return theme.copyWith(
      useMaterial3: true,
      dividerTheme:
          theme.dividerTheme.copyWith(thickness: 1, color: AppColor.divider),
      textTheme: AppTextStyle().textTheme(theme.textTheme),
      appBarTheme: theme.appBarTheme.copyWith(
        color: theme.colorScheme.primaryContainer,
        elevation: 9,
        shadowColor: AppColor.shadow,
        titleTextStyle: AppTextStyle().appBarTitle,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12),
          ),
        ),
        surfaceTintColor: theme.colorScheme.primaryContainer,
      ),
      bottomSheetTheme: theme.bottomSheetTheme
          .copyWith(surfaceTintColor: theme.colorScheme.onPrimary),
      dialogTheme: theme.dialogTheme
          .copyWith(surfaceTintColor: theme.colorScheme.primaryContainer),
      cardTheme: theme.cardTheme.copyWith(
          color: theme.colorScheme.surface,
          surfaceTintColor: theme.colorScheme.surface,
          shadowColor: AppColor.shadow,
          elevation: 15),
      radioTheme: theme.radioTheme.copyWith(fillColor: _RadioInputColor(theme)),
      switchTheme: theme.switchTheme.copyWith(
        trackColor: _SwitchTrackColor(theme),
        thumbColor: _SwitchThumbColor(theme),
        overlayColor: _SwitchTrackColor(theme),
        trackOutlineColor: _SwitchTrackColor(theme),
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      searchBarTheme: theme.searchBarTheme.copyWith(
          surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          constraints: const BoxConstraints(maxHeight: 42)),
      chipTheme: theme.chipTheme.copyWith(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
          showCheckmark: false,
          backgroundColor: theme.colorScheme.onPrimary,
          selectedColor: theme.primaryColor,
          elevation: 3,
          shadowColor: AppColor.shadow,
          side: const BorderSide(style: BorderStyle.none)),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        enabledBorder: theme.inputDecorationTheme.enabledBorder?.copyWith(
          borderSide: const BorderSide(color: AppColor.inputUnfocused),
        ),
      ),
    );
  }

  static final defaultRadius = BorderRadius.circular(12); 

  static final defaultShadow = [
    const BoxShadow(
        color: AppColor.shadow, blurRadius: 15, offset: Offset(0, 15))
  ];
  static final shortShadow = [
    const BoxShadow(color: AppColor.shadow, blurRadius: 5, offset: Offset(0, 5))
  ];
}

const FlexSchemeData _appFlexScheme = FlexSchemeData(
  name: 'Tu Ambia',
  description: 'Tu Ambia custom  theme',
  light: FlexSchemeColor(
    primary: AppColor.primary,
    primaryContainer: AppColor.container,
    appBarColor: AppColor.container,
    secondary: AppColor.secondary,
    secondaryContainer: AppColor.container,
  ),
  dark: FlexSchemeColor(
    primary: AppColor.primary,
    primaryContainer: AppColor.containerDark,
    secondary: AppColor.containerDark,
    secondaryContainer: AppColor.secondary,
  ),
);

class _RadioInputColor implements MaterialStateProperty<Color?> {
  final ThemeData theme;

  _RadioInputColor(this.theme);

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return theme.disabledColor.withOpacity(.2);
    }
    if (states.contains(MaterialState.selected)) {
      return theme.primaryColor;
    }
    return AppColor.radioUnselected;
  }
}

class _SwitchTrackColor implements MaterialStateProperty<Color?> {
  final ThemeData theme;

  _SwitchTrackColor(this.theme);

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return theme.disabledColor.withOpacity(.2);
    }
    if (states.contains(MaterialState.selected)) {
      return theme.primaryColor;
    }
    return AppColor.switchTrackUnfocused;
  }
}

class _SwitchThumbColor implements MaterialStateProperty<Color?> {
  final ThemeData theme;

  _SwitchThumbColor(this.theme);

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return Colors.white24;
    }

    return Colors.white;
  }
}
