import 'package:flutter/material.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';
import 'package:portfolio_website/presentation/widgets/credits_section/credits_section.dart';
import 'package:portfolio_website/presentation/widgets/shared/aesthetics/editor_tab_bar.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.void_,
      appBar: EditorTabBar(
        tabs: [
          EditorTab(
            label: 'home.dart',
            active: false,
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          EditorTab(
            label: 'projects.dart',
            active: false,
            onTap: () => Navigator.pushReplacementNamed(context, '/projects'),
          ),
          EditorTab(
            label: 'skills.dart',
            active: false,
            onTap: () => Navigator.pushReplacementNamed(context, '/skills'),
          ),
          EditorTab(label: 'credits.dart', active: true, onTap: () {}),
        ],
      ),
      body: CreditsSection(),
    );
  }
}
