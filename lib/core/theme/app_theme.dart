import 'package:flutter/material.dart';
import 'package:nour_store/core/theme/theme_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: ThemeColors.darkBackground,
        colorScheme: const ColorScheme.dark(
          primary: ThemeColors.goldPrimary,
          onPrimary: ThemeColors.blackColorF1,
          secondary: ThemeColors.goldLight,
          onSecondary: ThemeColors.blackColorF1,
          surface: ThemeColors.darkSurface,
          onSurface: ThemeColors.darkTextPrimary,
          error: ThemeColors.negative,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ThemeColors.darkSurface,
          foregroundColor: ThemeColors.darkTextPrimary,
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: CardThemeData(
          color: ThemeColors.darkCard,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: ThemeColors.darkDivider),
          ),
        ),
        dividerColor: ThemeColors.darkDivider,
        iconTheme: const IconThemeData(color: ThemeColors.goldPrimary),
      );

  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        scaffoldBackgroundColor: ThemeColors.lightBackground,
        colorScheme: const ColorScheme.light(
          primary: ThemeColors.goldPrimary,
          onPrimary: ThemeColors.lightTextPrimary,
          secondary: ThemeColors.goldDark,
          onSecondary: ThemeColors.whiteColor,
          surface: ThemeColors.lightSurface,
          onSurface: ThemeColors.lightTextPrimary,
          error: ThemeColors.negative,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ThemeColors.lightSurface,
          foregroundColor: ThemeColors.lightTextPrimary,
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: CardThemeData(
          color: ThemeColors.lightCard,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: ThemeColors.lightCardBorder),
          ),
        ),
        dividerColor: ThemeColors.lightDivider,
        iconTheme: const IconThemeData(color: ThemeColors.goldDark),
      );
}
