import 'package:flutter/material.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';
import 'package:portfolio_website/presentation/screens/credits_screen.dart';
import 'package:portfolio_website/presentation/screens/portfolio_screen.dart';
import 'package:portfolio_website/presentation/screens/project_screen.dart';
import 'package:portfolio_website/presentation/screens/skills_screen.dart';
import 'package:portfolio_website/presentation/widgets/shared/aesthetics/boot_screen.dart';

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
        switch (settings.name) {
          case '/projects':
            page = const ProjectScreen();
            break;
          case '/skills':
            page = const SkillsScreen();
            break;
          case '/credits':
            page = const CreditsScreen();
            break;
          case '/':
          default:
            page = PortfolioScreen();
        }

        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
      },
      title: 'Chenyu Lu | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.build(),
      builder: (context, child) =>
          BootScreen(child: SelectionArea(child: child!)),
    );
  }
}
