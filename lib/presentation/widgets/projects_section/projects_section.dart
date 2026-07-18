import 'package:flutter/material.dart';
import 'package:portfolio_website/core/models/project_model.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';
import 'package:portfolio_website/presentation/widgets/projects_section/project_row.dart';
import 'package:portfolio_website/presentation/widgets/shared/aesthetics/window_frame.dart';
import 'package:portfolio_website/presentation/widgets/shared/footer.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Project> projects = [
    Project(
      title: "Vera",
      description:
          "A cross-platform (Online and Windows) physics platform built for my school's official Physics club with student-taught tutorial videos, login authentication and a video storage feature to save progress.",
      technologies: ["Flutter", "Firebase", "Rest API", "Cloudflare"],
      githubUrl: "https://github.com/HisMonDon/Vera",
      liveUrl: "https://veraphysics.com/about",
      imageLinks: [
        "images/project_images/vera_project_1.png",
        "images/project_images/vera_project_2.png",
        "images/project_images/vera_project_3.png",
        "images/project_images/vera_project_4.png",
        "images/project_images/vera_project_5.png",
      ],
      overview:
          "Vera started as a way to give my school's Physics club a real home "
          "online instead of scattering resources across group chats and "
          "shared drives. It's a cross-platform app — usable both on the web "
          "and as a native Windows build — where club members can watch "
          "student-taught tutorial videos, log in, and pick up right where "
          "they left off.\n\n"
          "The backend runs on Firebase for auth and data, talking to a REST "
          "API layer, with the whole thing deployed behind Cloudflare for "
          "caching and DNS. Getting video progress to persist reliably across "
          "sessions — and across both the web and Windows builds — was the "
          "trickiest part of the build.",
      highlights: [
        "Cross-platform: one Flutter codebase ships to both web and Windows",
        "Login authentication so members' watch progress is saved per-account",
        "Student-taught tutorial video library organized by topic",
        "REST API + Firebase backend, deployed behind Cloudflare",
      ],
    ),
    Project(
      title: "Portfolio Website",
      description:
          "A portfolio website built with Flutter Web, showcasing my projects, skills, and experience. You're on it right now.",
      technologies: ["Flutter", "Dart"],
      githubUrl: "https://github.com/HisMonDon/portfolioWebsite",
      imageLinks: ["images/project_images/portfolio_project.png"],
      overview:
          "You're looking at it right now. This site is built entirely in "
          "Flutter Web rather than a typical HTML/CSS/JS stack — partly "
          "because Flutter is what I already know best, and partly to see "
          "how far a single Dart codebase could be pushed into something "
          "that reads as a real website rather than an app shell.\n\n"
          "It's gone through a few complete redesigns as my taste (and "
          "skills) have changed — this version leans into an editor/terminal "
          "aesthetic, right down to the navigation being styled as open file "
          "tabs and the hero rendering an actual little wireframe of the CN "
          "Tower.",
      highlights: [
        "Built entirely in Flutter Web — one Dart codebase, no separate frontend stack",
        "Custom-built 3D wireframe renderer for the CN Tower graphic (no external 3D library)",
        "Navigation styled as editor tabs, hero styled as a terminal session",
        "Open source — see exactly how it's built on GitHub",
      ],
    ),
    Project(
      title: "Pocket Pilot",
      description:
          "A mobile app that analyzes recipts and provides insights on spending habits, built with React Native, Firestore, Gemini API, and Cloudinary.",
      technologies: ["React Native", "Firebase", "Gemini API", "Cloudinary"],
      githubUrl: "https://github.com/justinnova0915/hack-canada-2026",
      imageLinks: [
        "images/project_images/pocketpilot3.jpg",
        "images/project_images/pocketpilot1.png",
        "images/project_images/pocketpilot2.png",
      ],
      liveUrl: "https://devpost.com/software/pocketpilot-gi9m3v",
      overview:
          "Built in about 36 hours at Hack Canada 2026 with a teammate, "
          "Pocket Pilot takes a photo of a receipt and turns it into an "
          "actual understanding of where your money is going. Snap a "
          "receipt, and the Gemini API parses out the line items, "
          "categorizes the spending, and feeds it back as insights instead "
          "of just a stored image.\n\n"
          "Cloudinary handles image storage and delivery, Firestore keeps "
          "the parsed data and history, and React Native ties it together "
          "into a single mobile app. Most of our time went into getting the "
          "Gemini prompt to reliably extract structured data from messy, "
          "real-world receipt photos.",
      highlights: [
        "Photograph a receipt and get structured spending data back in seconds",
        "Gemini API for OCR + categorization, not just plain text extraction",
        "Firestore for history, Cloudinary for image storage",
        "Built with a teammate at Hack Canada 2026",
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
      overview:
          "This one grew out of a calculus class — after learning integrals, "
          "I wanted to see them actually move something on screen instead of "
          "just sitting in a notebook. It's a C++ simulator that models a "
          "ball dropping into a liquid, using integration to compute the net "
          "buoyant and drag forces acting on it as it moves through a fluid "
          "of a density you can set yourself.\n\n"
          "SFML handles rendering and the render loop, CMake ties the build "
          "together, and a small GLSL shader adds the liquid's visual "
          "surface effect. It's a small project, but it's the one where "
          "physics and code clicked together for me the most directly.",
      highlights: [
        "Physics modeled with real integral calculus, not canned formulas",
        "Customizable liquid density changes the simulated motion in real time",
        "C++ and SFML for the simulation loop and rendering",
        "GLSL shader for the liquid surface",
      ],
    ),
    Project(
      title: "Competitive Programming",
      liveUrl: "https://dmoj.ca/user/HisMonDon",
      githubUrl: "https://github.com/HisMonDon/CCC_Senior",
      description:
          "Solved problems on DMOJ, focusing on the CCC contest. Worked with data strucutures, graph theory, and other algorithms. Achieved distinction (top 25%) on CCC Senior 2026.",
      technologies: ["C++", "Python", "Java"],
      imageLinks: [
        "images/project_images/competitive_project_0.png",
        "images/project_images/competitive_project_1.png",
        "images/project_images/competitive_project_2.png",
      ],
      overview:
          "Alongside building full apps, I spend a fair amount of time on "
          "DMOJ working through competitive programming problems, with a "
          "focus on the CCC (Canadian Computing Competition). It's less "
          "about any single project and more about building a toolbox — "
          "data structures, graph theory, greedy and DP approaches — that "
          "shows up in everything else I build.\n\n"
          "I've worked primarily in C++ for contest speed, with Python and "
          "Java for exploring alternate approaches to the same problems. "
          "That practice paid off directly: I placed with distinction (top "
          "25%) on CCC Senior 2026.",
      highlights: [
        "Distinction (top 25%) on CCC Senior 2026",
        "Focus areas: data structures, graph theory, and algorithm design",
        "Primarily C++, with Python and Java for comparison",
        "Problem archive and submissions on DMOJ",
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
      overview:
          "The Knight was my Grade 11 Computer Science culminating project "
          "— a 2D adventure game built from scratch in Python with Pygame. "
          "The world generates randomly each time you play, so no two runs "
          "lay out quite the same, and it's layered with a battle system and "
          "an in-game currency economy on top of that.\n\n"
          "Building the random world generation so it stayed playable — not "
          "just random for randomness's sake — was the core challenge. It "
          "capped off the course with a 99.",
      highlights: [
        "Randomly generated world layout on every playthrough",
        "Custom battle system and in-game currency/economy",
        "Built solo in Python with Pygame",
        "Final Grade 11 Computer Science project — scored 99",
      ],
    ),
    Project(
      title: "More coming soon!",
      description: "Stay tuned for more projects coming soon!",
      technologies: [],
      imageLinks: ["images/project_images/coming_soon.png"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 36),
                const CommentEyebrow(text: 'projects'),
                const SizedBox(height: 12),
                Text(
                  "My Projects",
                  style: textTheme.displayLarge?.copyWith(fontSize: 44),
                ),
                const SizedBox(height: 16),
                Text(
                  "Here are a few things I've been working on.",
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.line),
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  for (final project in projects) ProjectRow(project: project),
                ],
              ),
            ),
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
  }
}
