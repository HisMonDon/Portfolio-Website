import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/presentation/screens/portfolio_screen.dart'; // This will be our main screen

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chenyu Lu | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home:
          const PortfolioScreen(), // The main screen widget that will hold all your sections
    );
  }

  ThemeData _buildTheme() {
    const Color deepSpace = Color(0xFF0A192F);
    const Color starlight = Color(0xFFFFC300);
    const Color nebulaBlue = Color(0xFF4FD2E0);
    const Color stardust = Color(0xFFE6F1FF);

    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: starlight,
      scaffoldBackgroundColor: deepSpace,

      textTheme: TextTheme(
        displayLarge: GoogleFonts.exo2(
          fontSize: 72,
          fontWeight: FontWeight.bold,
          color: starlight,
        ),
        headlineMedium: GoogleFonts.spaceGrotesk(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: stardust,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: stardust,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          color: const Color.fromARGB(213, 230, 241, 255),
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          color: const Color.fromARGB(214, 230, 241, 255),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: deepSpace,
          backgroundColor: starlight,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      iconTheme: IconThemeData(color: nebulaBlue, size: 24),
    );
  }
}
