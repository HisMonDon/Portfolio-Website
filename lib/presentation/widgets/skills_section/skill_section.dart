import 'package:flutter/material.dart';
import 'package:portfolio_website/core/models/skills_model.dart';
import 'package:portfolio_website/presentation/widgets/shared/aesthetics/window_frame.dart';
import 'package:portfolio_website/presentation/widgets/shared/footer.dart';
import 'package:portfolio_website/presentation/widgets/skills_section/skills_card.dart';

class SkillSection extends StatelessWidget {
  SkillSection({super.key});

  final List<Skills> skills = [
    Skills(
      name: "React",
      imageUrl: "images/skill_icons/react_icon_skills.png",
      time: "1 Year",
    ),
    Skills(
      name: "Javascript",
      imageUrl: "images/skill_icons/javascript_icon_skills.png",
      time: "1 Year",
    ),
    Skills(
      name: "Flutter",
      imageUrl: "images/skill_icons/flutter_icon_skills.png",
      time: "2 Years",
    ),
    Skills(
      name: "Dart",
      imageUrl: "images/skill_icons/dart_icon_skills.png",
      time: "2 Years",
    ),
    Skills(
      name: "C++",
      imageUrl: "images/skill_icons/cpp_icon_skills.png",
      time: "3 Years",
    ),
    Skills(
      name: "Python",
      imageUrl: "images/skill_icons/python_icon_skills.png",
      time: "4 Years",
    ),
    Skills(
      name: "Java",
      imageUrl: "images/skill_icons/java_icon_skills.png",
      time: "3 Years",
    ),
    Skills(
      name: "Git",
      imageUrl: "images/skill_icons/git_icon_skills.png",
      time: "2 Years",
    ),
    Skills(
      name: "SFML",
      imageUrl: "images/skill_icons/sfml_icon_skills.png",
      time: "2 Years",
    ),
    Skills(
      name: "VS Code",
      imageUrl: "images/skill_icons/vscode_icon_skills.png",
      time: "4 Years",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 3;
        if (constraints.maxWidth < 1200) crossAxisCount = 2;
        if (constraints.maxWidth < 800) crossAxisCount = 1;

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 36),
                    const CommentEyebrow(text: 'stack'),
                    const SizedBox(height: 12),
                    Text(
                      "Technical Skills",
                      style: Theme.of(
                        context,
                      ).textTheme.displayLarge?.copyWith(fontSize: 44),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 48.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 4.0,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return SkillsCard(skill: skills[index]);
                }, childCount: skills.length),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [const Footer()],
              ),
            ),
          ],
        );
      },
    );
  }
}
