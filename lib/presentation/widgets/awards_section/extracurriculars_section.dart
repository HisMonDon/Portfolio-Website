import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/core/models/project_model.dart';
import 'package:portfolio_website/presentation/widgets/shared/footer.dart';
import 'package:portfolio_website/presentation/widgets/shared/projects_image_scroller.dart';

class ExtracurricularsSection {
  final List<Project> extracurriculars = [
    Project(
      title: "St. Robert Physics Club Executive Trainer",
      description:
          "Collaborated with other trainers to apply physics concepts into experiments and learning",
      technologies: [],
      imageLinks: [
        "images/extracurricular_images/extracurriculars_physics.png",
      ],
    ),
    Project(
      title: "Spirit of Math Assistant teacher",
      description:
          "Did one-on-one tutoring with students ranging fron Grades 7-10, helped monitor, tutor, and maintain group classes.",
      technologies: [],
      imageLinks: [
        "images/extracurricular_images/extracurriculars_spirit_of_math.png",
      ],
    ),
    Project(
      title: "St. Robert La Silhouette Executive Trainer",
      description:
          "Planned and taught lessons for St.Robert's French article writing club, promoting French grammar, culture, and creativity.",
      technologies: [],
      imageLinks: [
        "images/extracurricular_images/extracurriculars_la_silhouette.png",
      ],
    ),
    Project(
      title: "Lakeridge Level 2 Ski Instructor",
      description:
          "Taught 7-week-long private courses to intermediate and beginner skiiers ranging from ages 4 - 45. Communicated to parents on progress, and designed activities to help students learn and have fun.",
      technologies: [],
      imageLinks: [
        "images/extracurricular_images/extracurriculars_lakeridge.png",
      ],
    ),
    Project(
      title: "St. Robert Swim Team and Lifesaving Club of Markham Red Division",
      description:
          "Competed at Regional Meets and qualified for YRAA on the St.Robert Swim Team. Learned lifesaving techniques while improving swimming in the Lifesaving Club of Markham, competing at the provincial level.",
      technologies: [],
      imageLinks: [
        "images/extracurricular_images/extracurriculars_swim_team.png",
      ],
    ),
    Project(
      title: "St. Robert CaYPT Team",
      description:
          "Competed and achieved silver (third place in Canada) at the Canadian Young Physics Tournament, calculated and conducted experiments to investigate the wavelength shift from the scattering of light in polystyerene.",
      technologies: [],
      imageLinks: ["images/extracurricular_images/extracurriculars_caypt.png"],
    ),
    Project(
      title: "St. Robert STEAM ICAC Executive Trainer",
      description:
          "Taught and prepared students for the St.Robert STEAM ICAC team, an annual conference that challenges students to solve real-world issues through STEAM.",
      technologies: [],
      imageLinks: [
        "images/extracurricular_images/extracurriculars_steam_icac.png",
      ],
    ),
  ];

  List<Widget> buildSlivers(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                "Extracurriculars",
                style: textTheme.displayLarge?.copyWith(fontSize: 48),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 15.0),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 800,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.1,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) =>
                _ExtracurricularsCard(extracurricular: extracurriculars[index]),
            childCount: extracurriculars.length,
          ),
        ),
      ),
    ];
  }
}

class _ExtracurricularsCard extends StatefulWidget {
  final Project extracurricular;

  const _ExtracurricularsCard({required this.extracurricular});

  @override
  __ExtracurricularsCardState createState() => __ExtracurricularsCardState();
}

class __ExtracurricularsCardState extends State<_ExtracurricularsCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = const Color.fromARGB(255, 253, 228, 4);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.basic,
      child: Animate(
        effects: [
          FadeEffect(duration: 600.ms, curve: Curves.easeOut),
          ScaleEffect(
            begin: const Offset(0.95, 0.95),
            curve: Curves.easeOutBack,
          ),
        ],
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.school_outlined, color: primaryColor, size: 36),
                    const SizedBox(height: 15),
                    if (widget.extracurricular.imageLinks.isNotEmpty)
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: ProjectsImageScroller(
                          images: widget.extracurricular.imageLinks,
                        ),
                      ),
                    const Spacer(),
                    Text(
                      widget.extracurricular.title,
                      style: textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.extracurricular.description,
                      style: textTheme.bodyMedium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
