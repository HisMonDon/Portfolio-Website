import 'package:flutter/material.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';
import 'package:portfolio_website/presentation/widgets/projects_section/projects_section.dart';
import 'package:portfolio_website/presentation/widgets/shared/aesthetics/editor_tab_bar.dart';
import 'package:portfolio_website/presentation/widgets/shared/footer.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key}) : super(key: key);

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
          EditorTab(label: 'projects.dart', active: true, onTap: () {}),
          EditorTab(
            label: 'skills.dart',
            active: false,
            onTap: () => Navigator.pushReplacementNamed(context, '/skills'),
          ),
        ],
      ),
      body: ProjectsSection(),
      bottomNavigationBar: const Footer(),
    );
  }
}
