import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design tokens for the "editor" theme: a dark IDE/terminal aesthetic.
class AppColors {
  AppColors._();

  static const Color void_ = Color(0xFF0B0E14);
  static const Color panel = Color(0xFF121722);
  static const Color panelAlt = Color(0xFF1A2130);
  static const Color line = Color(0xFF232B39);
  static const Color ink = Color(0xFFE3E8EF);
  static const Color fog = Color(0xFF7C8A9E);
  static const Color keyword = Color(0xFFE3A857);
  static const Color string = Color(0xFF55C7B4);

  // Decorative window-chrome traffic lights (macOS-terminal style).
  static const Color trafficRed = Color(0xFFFF5F57);
  static const Color trafficYellow = Color(0xFFFEBC2E);
  static const Color trafficGreen = Color(0xFF28C840);
}

class AppTheme {
  AppTheme._();

  static ThemeData build() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.keyword,
      scaffoldBackgroundColor: AppColors.void_,
      splashFactory: NoSplash.splashFactory,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.jetBrainsMono(
          fontSize: 64,
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
          height: 1.1,
        ),
        headlineMedium: GoogleFonts.jetBrainsMono(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
        ),
        headlineSmall: GoogleFonts.jetBrainsMono(
          fontSize: 16,
          color: AppColors.string,
        ),
        titleLarge: GoogleFonts.jetBrainsMono(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
        ),
        titleMedium: GoogleFonts.jetBrainsMono(fontSize: 14, color: AppColors.fog),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          color: AppColors.fog,
          height: 1.7,
        ),
        bodyMedium: GoogleFonts.inter(fontSize: 14, color: AppColors.fog),
        bodySmall: GoogleFonts.inter(fontSize: 13, color: AppColors.fog),
        labelSmall: GoogleFonts.jetBrainsMono(
          fontSize: 12,
          color: AppColors.fog,
          letterSpacing: 0.4,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          mouseCursor: WidgetStateProperty.all(SystemMouseCursors.click),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(AppColors.ink),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: const BorderSide(color: AppColors.line),
            ),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          ),
          textStyle: WidgetStateProperty.all(
            GoogleFonts.jetBrainsMono(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.pressed)) {
              return AppColors.keyword.withOpacity(0.12);
            }
            return null;
          }),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.keyword, size: 22),
      dividerColor: AppColors.line,
    );
  }
}
