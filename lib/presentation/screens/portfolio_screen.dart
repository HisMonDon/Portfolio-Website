import 'package:flutter/material.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';
import 'package:portfolio_website/presentation/widgets/home_section/about_me.dart';
import 'package:portfolio_website/presentation/widgets/home_section/home_section.dart';
import 'package:portfolio_website/presentation/widgets/shared/footer.dart';
import 'package:portfolio_website/presentation/widgets/shared/aesthetics/editor_tab_bar.dart';

class PortfolioScreen extends StatelessWidget {
  PortfolioScreen({Key? key}) : super(key: key);

  final homeKey = GlobalKey();
  final aboutMeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.void_,
      appBar: EditorTabBar(
        tabs: [
          EditorTab(label: 'home.dart', active: true, onTap: () {}),
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
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBox(
              key: homeKey,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 56,
              ),
              child: Center(child: HomeSection(aboutMeKey: aboutMeKey)),
            ),
            SizedBox(
              key: aboutMeKey,
              child: Center(child: AboutMeSection()),
            ),
            const SizedBox(height: 90),
          ],
        ),
      ),
      bottomNavigationBar: Footer(homeKey: homeKey, aboutMeKey: aboutMeKey),
    );
  }
}
