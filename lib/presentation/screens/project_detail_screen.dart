import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_website/core/constants/utils.dart';
import 'package:portfolio_website/core/models/project_model.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';
import 'package:portfolio_website/presentation/widgets/shared/aesthetics/editor_tab_bar.dart';
import 'package:portfolio_website/presentation/widgets/shared/aesthetics/window_frame.dart';
import 'package:portfolio_website/presentation/widgets/shared/footer.dart';
import 'package:portfolio_website/presentation/widgets/shared/projects_image_scroller.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;
  const ProjectDetailScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final fileName = projectFileName(project);
    final accent = projectAccentColor(project);

    return Scaffold(
      backgroundColor: AppColors.void_,
      appBar: EditorTabBar(
        tabs: [
          EditorTab(
            label: 'home.dart',
            active: false,
            onTap: () => Navigator.of(context).popUntil((r) => r.isFirst),
          ),
          EditorTab(
            label: 'projects.dart',
            active: false,
            onTap: () => Navigator.of(context).pop(),
          ),
          EditorTab(
            label: 'skills.dart',
            active: false,
            onTap: () {
              Navigator.of(context).popUntil((r) => r.isFirst);
              Navigator.of(context).pushReplacementNamed('/skills');
            },
          ),
          EditorTab(
            label: fileName,
            active: true,
            onTap: () {},
            onClose: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 48,
                  ),
                  child:
                      Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommentEyebrow(text: 'projects / $fileName'),
                              const SizedBox(height: 16),
                              Text(
                                project.title,
                                style: Theme.of(context).textTheme.displayLarge
                                    ?.copyWith(fontSize: 40),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                project.description,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: AppColors.fog,
                                  height: 1.6,
                                ),
                              ),
                              const SizedBox(height: 24),
                              if (project.technologies.isNotEmpty)
                                _TechRow(project: project),
                              const SizedBox(height: 20),
                              _LinkButtons(project: project),
                              const SizedBox(height: 36),
                              if (project.imageLinks.isNotEmpty)
                                WindowFrame(
                                  label: 'preview.png',
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: ProjectsImageScroller(
                                      images: project.imageLinks,
                                      imageHeight: 340,
                                    ),
                                  ),
                                ),
                              const SizedBox(height: 40),
                              if (project.overview != null) ...[
                                const CommentEyebrow(text: 'overview'),
                                const SizedBox(height: 16),
                                Text(
                                  project.overview!,
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    color: AppColors.ink,
                                    height: 1.8,
                                  ),
                                ),
                                const SizedBox(height: 40),
                              ],
                              if (project.highlights.isNotEmpty) ...[
                                const CommentEyebrow(text: 'highlights'),
                                const SizedBox(height: 16),
                                for (final highlight in project.highlights)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '> ',
                                          style: GoogleFonts.jetBrainsMono(
                                            fontSize: 15,
                                            color: accent,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            highlight,
                                            style: GoogleFonts.inter(
                                              fontSize: 15,
                                              color: AppColors.fog,
                                              height: 1.5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                const SizedBox(height: 24),
                              ],
                            ],
                          )
                          .animate()
                          .fadeIn(duration: 400.ms)
                          .slideY(begin: 0.05, end: 0.0),
                ),
              ),
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
      ),
    );
  }
}

class _TechRow extends StatelessWidget {
  final Project project;
  const _TechRow({required this.project});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: project.technologies
          .map(
            (tech) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.panelAlt,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.line),
              ),
              child: Text(
                '--${tech.toLowerCase().replaceAll(' ', '-')}',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 12.5,
                  color: AppColors.string,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _LinkButtons extends StatelessWidget {
  final Project project;
  const _LinkButtons({required this.project});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (project.githubUrl != null)
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton.icon(
              onPressed: () => launchUrl(Uri.parse(project.githubUrl!)),
              icon: const FaIcon(FontAwesomeIcons.github, size: 16),
              label: const Text('view on github'),
            ),
          ),
        if (project.liveUrl != null)
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.keyword.withOpacity(0.12),
              side: const BorderSide(color: AppColors.keyword),
            ),
            onPressed: () => launchUrl(Uri.parse(project.liveUrl!)),
            icon: const Icon(Icons.open_in_new, size: 16),
            label: const Text('live demo'),
          ),
      ],
    );
  }
}
