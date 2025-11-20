import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/presentation/screens/awards_screen.dart';
import 'package:portfolio_website/presentation/screens/portfolio_screen.dart';
import 'package:portfolio_website/presentation/screens/project_screen.dart';
import 'package:portfolio_website/presentation/screens/skills_screen.dart';

import 'package:portfolio_website/presentation/widgets/shared/aesthetics/cursor_glow.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const CursorGlow(child: PortfolioScreen()),
        '/projects': (context) => const CursorGlow(
          glowColor: Color.fromARGB(255, 100, 255, 219),
          child: ProjectScreen(),
        ),
        '/awards': (context) => const CursorGlow(
          glowColor: Color.fromARGB(255, 255, 215, 0),
          child: AwardsScreen(),
        ),
        '/skills': (context) => const CursorGlow(
          glowColor: Color.fromARGB(255, 46, 0, 83),
          child: SkillsScreen(),
        ),
      },

      title: 'Chenyu Lu | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
    );
  }

  ThemeData _buildTheme() {
    //const Color deepSpace = Color.fromARGB(255, 7, 1, 12);
    const Color deepSpace = Color.fromARGB(255, 6, 2, 20);
    const Color electricBlue = Color(0xFF64FFDA);
    const Color lightBlue = Color(0xFF8892B0);
    const Color lightestBlue = Color(0xFFCCD6F6);

    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: electricBlue,
      scaffoldBackgroundColor: deepSpace,

      textTheme: TextTheme(
        displayLarge: GoogleFonts.exo2(
          fontSize: 72,
          fontWeight: FontWeight.bold,
          color: lightestBlue,
        ),
        headlineMedium: GoogleFonts.spaceGrotesk(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: lightestBlue,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: lightestBlue,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          color: lightBlue,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.poppins(fontSize: 14, color: lightBlue),
        headlineSmall: GoogleFonts.poppins(fontSize: 18, color: lightBlue),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          mouseCursor: WidgetStateProperty.all(SystemMouseCursors.click),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(electricBlue),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          side: WidgetStateProperty.all(
            BorderSide(color: electricBlue, width: 1.5),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          textStyle: WidgetStateProperty.all(
            GoogleFonts.poppins(fontWeight: FontWeight.w500),
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.pressed)) {
              return const Color.fromARGB(237, 20, 205, 238);
            }
            return null;
          }),
        ),
      ),
      iconTheme: IconThemeData(color: electricBlue, size: 24),
    );
  }
}
