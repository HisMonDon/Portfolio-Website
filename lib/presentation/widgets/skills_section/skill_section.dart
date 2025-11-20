import 'package:flutter/material.dart';
import 'package:portfolio_website/core/models/skills_model.dart';
import 'package:portfolio_website/presentation/widgets/shared/footer.dart';
import 'package:portfolio_website/presentation/widgets/skills_section/skills_card.dart';

class SkillSection extends StatelessWidget {
  SkillSection({super.key});

  final List<Skills> skills = [
    Skills(
      name: "Flutter",
      imageUrl: "images/skill_icons/flutter_icon_skills.png",
      time: "1 Year",
    ),
    Skills(
      name: "Dart",
      imageUrl: "images/skill_icons/dart_icon_skills.png",
      time: "1 Year",
    ),
    Skills(
      name: "C++",
      imageUrl: "images/skill_icons/cpp_icon_skills.png",
      time: "2 Years",
    ),
    Skills(
      name: "Python",
      imageUrl: "images/skill_icons/python_icon_skills.png",
      time: "4 Years",
    ),
    Skills(
      name: "Java",
      imageUrl: "images/skill_icons/java_icon_skills.png",
      time: "2 Years",
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
    final textTheme = Theme.of(context).textTheme;

    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      width: double.infinity,

      child: Container(
        decoration: BoxDecoration(
          //color: const Color.fromARGB(111, 68, 208, 255),
          // borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 3;
                  if (constraints.maxWidth < 1200) {
                    crossAxisCount = 2;
                  }
                  if (constraints.maxWidth < 800) {
                    crossAxisCount = 1;
                  }

                  return Container(
                    width: double.infinity,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount = 3;
                        if (constraints.maxWidth < 1200) crossAxisCount = 2;
                        if (constraints.maxWidth < 800) crossAxisCount = 1;

                        return CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 30),
                                    Text(
                                      "Technical Skills",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge
                                          ?.copyWith(fontSize: 48),
                                    ),
                                    const SizedBox(height: 60),
                                  ],
                                ),
                              ),
                            ),
                            SliverPadding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 0,
                              ),
                              sliver: SliverGrid(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: crossAxisCount,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20,
                                      childAspectRatio: 4.0,
                                    ),
                                delegate: SliverChildBuilderDelegate((
                                  context,
                                  index,
                                ) {
                                  return SkillsCard(skill: skills[index]);
                                }, childCount: skills.length),
                              ),
                            ),
                            SliverFillRemaining(
                              hasScrollBody: false,
                              fillOverscroll: true,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [Footer()],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
