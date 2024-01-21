import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class CustomTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static CustomTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

// color 입력해야
  late Color? primary = Colors.indigo[400];
  late Color secondary;
  late Color? tertiary = Colors.tealAccent;
  late Color? alternate = Colors.grey[100];
  late Color? primaryText = Colors.grey[800];
  late Color? secondaryText = Colors.grey[500];
  late Color? primaryBackground = Colors.grey[100];
  late Color? secondaryBackground = Colors.white;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color background;
  late Color darkBackground;
  late Color textColor = Colors.white;
  late Color grayDark;
  late Color grayLight = const Color(0xFFD7CCC8);

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends CustomTheme {}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final CustomTheme theme;

  @override
  String get displayLargeFamily => 'Pretendard';
  @override
  TextStyle get displayLarge => TextStyle(
      color: theme.primaryText, fontWeight: FontWeight.normal, fontSize: 57.0);
  @override
  String get displayMediumFamily => 'Pretendard';
  @override
  TextStyle get displayMedium => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 45.0,
      );
  @override
  String get displaySmallFamily => 'Pretendard';
  @override
  TextStyle get displaySmall => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 32.0,
      );
  @override
  String get headlineLargeFamily => 'Pretendard';
  @override
  TextStyle get headlineLarge => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32.0,
      );
  @override
  String get headlineMediumFamily => 'Pretendard';
  @override
  TextStyle get headlineMedium => TextStyle(
        color: theme.primary,
        fontWeight: FontWeight.w500,
        fontSize: 28.0,
      );
  @override
  String get headlineSmallFamily => 'Pretendard';
  @override
  TextStyle get headlineSmall => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  @override
  String get titleLargeFamily => 'Pretendard';
  @override
  TextStyle get titleLarge => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  @override
  String get titleMediumFamily => 'Pretendard';
  @override
  TextStyle get titleMedium => TextStyle(
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  @override
  String get titleSmallFamily => 'Pretendard';
  @override
  TextStyle get titleSmall => TextStyle(
        color: theme.alternate,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  @override
  String get labelLargeFamily => 'Pretendard';
  @override
  TextStyle get labelLarge => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  @override
  String get labelMediumFamily => 'Pretendard';
  @override
  TextStyle get labelMedium => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  @override
  String get labelSmallFamily => 'Pretendard';
  @override
  TextStyle get labelSmall => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 11.0,
      );
  @override
  String get bodyLargeFamily => 'Pretendard';
  @override
  TextStyle get bodyLarge => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  @override
  String get bodyMediumFamily => 'Pretendard';
  @override
  TextStyle get bodyMedium => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  @override
  String get bodySmallFamily => 'Pretendard';
  @override
  TextStyle get bodySmall => TextStyle(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
}

class DarkModeTheme extends CustomTheme {}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? TextStyle(
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
