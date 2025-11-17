import 'package:flutter/material.dart';
import 'package:portfolio_website/core/models/project_model.dart';
import 'package:portfolio_website/presentation/widgets/projects_section/project_card.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Project> projects = [
    Project(
      title: "Flutter Portfolio Website",
      description:
          "A responsive portfolio website built with Flutter Web, showcasing my projects, skills, and experience with a space-themed animated background.",
      technologies: ["Flutter", "Dart"],
      githubUrl: "https://github.com/HisMonDon/portfolioWebsite",
    ),
    Project(
      title: "Vera",
      description: "VeraVeraVeraVeraVeraVeraVeraVeraVeraVeraVeraVera skibeedee",
      technologies: ["Flutter", "Firebase", "Rest API", "Cloudflare"],
      githubUrl: "https://github.com/HisMonDon/example-ecommerce",
      liveUrl: "https://example-ecommerce.com",
    ),
    Project(
      title: "Integrals buoyancy Simulator",
      description:
          "A C++ based physics simulator to write this later aspdoicpasocm",
      technologies: ["C++", "SFML"],
      githubUrl: "https://github.com/HisMonDon/example-ml-model",
    ),
    Project(
      title: "Pathfinding Visualizer",
      description:
          "An interactive web application that visualizes pathfinding algorithms like A* and Dijkstra's on a user-definable grid.",
      technologies: ["JavaScript", "React", "HTML5 Canvas"],
      githubUrl: "https://github.com/HisMonDon/pathfinding-visualizer",
      liveUrl: "https://example-pathfinding.com",
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
                                childAspectRatio: 1.1,
                              ),
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            return ProjectCard(project: projects[index]);
                          }, childCount: projects.length),
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
