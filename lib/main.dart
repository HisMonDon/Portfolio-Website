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
      //routes: {'/home': (context) => const PortfolioApp()},
    );
  }

  ThemeData _buildTheme() {
    //const Color deepSpace = Color.fromARGB(255, 7, 1, 12);
    const Color deepSpace = Color.fromARGB(255, 6, 2, 20);
    const Color starlight = Color.fromARGB(255, 255, 195, 0);
    const Color nebulaBlue = Color.fromARGB(255, 79, 210, 224);
    const Color stardust = Color.fromARGB(255, 230, 241, 255);

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
        style: ButtonStyle(
          mouseCursor: WidgetStateProperty.all(SystemMouseCursors.click),
          backgroundColor: WidgetStateProperty.all(starlight),
          foregroundColor: WidgetStateProperty.all(deepSpace),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          textStyle: WidgetStateProperty.all(
            GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.hovered)) {
              return Color.fromARGB(228, 255, 255, 255);
            }
            if (states.contains(WidgetState.pressed)) {
              return Color.fromARGB(255, 241, 240, 240);
            }
            return null;
          }),
        ),
      ),
      iconTheme: IconThemeData(color: starlight, size: 24),
    );
  }
}
