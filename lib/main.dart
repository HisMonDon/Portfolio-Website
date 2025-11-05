import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/presentation/screens/portfolio_screen.dart';

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
      home: const PortfolioScreen(),
    );
  }

  ThemeData _buildTheme() {
    const Color deepSpace = Color.fromARGB(255, 10, 25, 47);
    const Color starlight = Color.fromARGB(255, 255, 195, 0);
    const Color nebulaBlue = Color.fromARGB(255, 79, 210, 224);
    const Color stardust = Color.fromARGB(255, 230, 241, 255);

    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: starlight,
      scaffoldBackgroundColor: const Color.fromARGB(255, 5, 20, 43),

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
