import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/presentation/widgets/shared/projects_image_scroller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_website/core/models/project_model.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final List<String> imageLinks;
  const ProjectCard({
    super.key,
    required this.project,
    required this.imageLinks,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).primaryColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (widget.project.liveUrl != null) {
            launchUrl(Uri.parse(widget.project.liveUrl!));
          } else if (widget.project.githubUrl != null) {
            launchUrl(Uri.parse(widget.project.githubUrl!));
          }
        },
        child: Animate(
          effects: [
            FadeEffect(duration: 600.ms, curve: Curves.easeOut),
            ScaleEffect(begin: Offset(0.95, 0.95), curve: Curves.easeOutBack),
          ],
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.28),
                        blurRadius: 24,
                        spreadRadius: 1,
                        offset: const Offset(0, 12),
                      ),
                    ]
                  : [],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(22, 20, 22, 22),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.11),
                        Colors.black.withOpacity(0.32),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: _isHovered
                          ? primaryColor.withOpacity(0.45)
                          : Colors.white.withOpacity(0.18),
                      width: 1.2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.project.title,
                              style: textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                height: 1.15,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 12),
                          _buildLinkButtons(),
                        ],
                      ),
                      const SizedBox(height: 18),
                      ProjectsImageScroller(
                        images: widget.imageLinks,
                        imageHeight: 160,
                      ),
                      const SizedBox(height: 16),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.project.description,
                              style: textTheme.bodyMedium?.copyWith(
                                fontSize: 15.5,
                                height: 1.45,
                                color: Colors.white.withOpacity(0.86),
                              ),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 14),
                            _buildTechStack(textTheme, primaryColor),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        height: 2,
                        width: _isHovered ? 72 : 42,
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(
                            _isHovered ? 0.75 : 0.42,
                          ),
                          borderRadius: BorderRadius.circular(99),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLinkButtons() {
    return Row(
      children: [
        if (widget.project.githubUrl != null)
          _buildLinkButton(
            icon: const FaIcon(FontAwesomeIcons.github),
            tooltip: 'View on GitHub',
            onPressed: () => launchUrl(Uri.parse(widget.project.githubUrl!)),
          ),
        if (widget.project.liveUrl != null)
          _buildLinkButton(
            icon: const Icon(Icons.open_in_new),
            tooltip: 'View Live Demo',
            onPressed: () => launchUrl(Uri.parse(widget.project.liveUrl!)),
          ),
      ],
    );
  }

  Widget _buildLinkButton({
    required Widget icon,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
        iconSize: 20,
        color: Colors.white.withOpacity(0.82),
        tooltip: tooltip,
        constraints: const BoxConstraints.tightFor(width: 38, height: 38),
        style: IconButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.08),
          hoverColor: Theme.of(context).primaryColor.withOpacity(0.18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildTechStack(TextTheme textTheme, Color primaryColor) {
    if (widget.project.technologies.isEmpty) {
      return Text(
        'More details soon',
        style: textTheme.bodySmall?.copyWith(
          fontSize: 13.5,
          color: Colors.white.withOpacity(0.62),
          fontStyle: FontStyle.italic,
        ),
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 2),
          child: Text(
            'Built with',
            style: textTheme.labelSmall?.copyWith(
              fontSize: 12,
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w700,
              letterSpacing: 0.7,
            ),
          ),
        ),
        ...widget.project.technologies.map(
          (tech) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: primaryColor.withOpacity(0.24)),
            ),
            child: Text(
              tech,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 13.5,
                color: primaryColor,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
