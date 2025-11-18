import 'package:flutter/material.dart';
import 'package:portfolio_website/core/models/project_model.dart';
import 'package:portfolio_website/presentation/widgets/projects_section/project_card.dart';
import 'package:portfolio_website/presentation/widgets/shared/footer.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Project> projects = [
    Project(
      title: "Flutter Portfolio Website",
      description:
          "A portfolio website built with Flutter Web, showcasing my projects, skills, and experience with a space-themed animated background. You're on it right now.",
      technologies: ["Flutter", "Dart"],
      githubUrl: "https://github.com/HisMonDon/portfolioWebsite",
      imageLinks: ["images/project_images/portfolio_project.png"],
    ),
    Project(
      title: "Vera",
      description:
          "A cross-platform (Online and Windows) physics platform built for my school's official Physics club with student-taught tutorial videos, login authentication and a video storage feature to save progress.",
      technologies: ["Flutter", "Firebase", "Rest API", "Cloudflare"],
      githubUrl: "https://github.com/HisMonDon/Vera",
      liveUrl: "https://veraphysics.com",
      imageLinks: [
        "images/project_images/vera_project_1.png",
        "images/project_images/vera_project_2.png",
        "images/project_images/vera_project_3.png",
        "images/project_images/vera_project_4.png",
        "images/project_images/vera_project_5.png",
      ],
    ),
    Project(
      title: "Integrals buoyancy Simulator",
      description:
          "A C++ based physics simulator using calculus and integrals to simulate a ball's net motion when dropped in a liquid with a customizable density.",
      technologies: ["C++", "SFML", "CMake", "GLSL"],
      githubUrl: "https://github.com/HisMonDon/Buoyancy-Simulator",
      imageLinks: [
        "images/project_images/buoyancy_project_1.png",
        "images/project_images/buoyancy_project_2.png",
      ],
    ),
    Project(
      title: "The Knight",
      description:
          "2D adventure game, with random world generation, and a battle and currency system. This was my Grade 11 Computer Science CPT, and I finished with a 99.",
      technologies: ["Python", "Pygame"],
      imageLinks: [
        "images/project_images/cpt_project_1.png",
        "images/project_images/cpt_project_2.png",
      ],
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

                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              SizedBox(height: 30),
                              Text(
                                "My Projects",
                                style: textTheme.displayLarge?.copyWith(
                                  fontSize: 48,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Here are a few things I've been working on.",
                                style: textTheme.headlineSmall?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              const SizedBox(height: 60),
                            ],
                          ),
                        ),
                      ),

                      SliverPadding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 15.0,
                        ),
                        sliver: SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 1.0,
                              ),
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            return ProjectCard(
                              project: projects[index],
                              imageLinks: projects[index].imageLinks,
                            );
                          }, childCount: projects.length),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Footer(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
