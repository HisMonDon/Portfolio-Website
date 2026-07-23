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
      onGenerateRoute: (settings) {
        Widget page;
        Color? glowColor;

        switch (settings.name) {
          case '/projects':
            page = const ProjectScreen();
            glowColor = const Color.fromARGB(255, 100, 255, 219);
            break;
          case '/awards':
            page = const AwardsScreen();
            glowColor = const Color.fromARGB(255, 255, 215, 0);
            break;
          case '/skills':
            page = const SkillsScreen();
            glowColor = const Color.fromARGB(255, 46, 0, 83);
            break;
          case '/':
          default:
            page = const PortfolioScreen();
            glowColor = null;
        }

        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              CursorGlow(child: page, glowColor: glowColor),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
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
          mouseCursor: MaterialStateProperty.all(SystemMouseCursors.click),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(electricBlue),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: electricBlue, width: 1.5),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          textStyle: MaterialStateProperty.all(
            GoogleFonts.poppins(fontWeight: FontWeight.w500),
          ),
          overlayColor: MaterialStateProperty.resolveWith((Set states) {
            if (states.contains(MaterialState.hovered) ||
                states.contains(MaterialState.pressed)) {
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
