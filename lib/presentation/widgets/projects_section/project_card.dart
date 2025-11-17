import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_website/core/models/project_model.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

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
            transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
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
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    bottom: 12,
                  ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.folder_open_rounded,
                            color: primaryColor,
                            size: 36,
                          ),
                          _buildLinkButtons(),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        widget.project.title,
                        style: textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.project.description,
                        style: textTheme.bodyMedium,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      _buildTechStack(textTheme, primaryColor),
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
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.github),
            onPressed: () => launchUrl(Uri.parse(widget.project.githubUrl!)),
            iconSize: 22,
            color: Colors.white.withOpacity(0.8),
            tooltip: 'View on GitHub',
            hoverColor: Theme.of(context).primaryColor.withOpacity(0.2),
          ),
        if (widget.project.liveUrl != null)
          IconButton(
            icon: const Icon(Icons.open_in_new),
            onPressed: () => launchUrl(Uri.parse(widget.project.liveUrl!)),
            iconSize: 24,
            color: Colors.white.withOpacity(0.8),
            tooltip: 'View Live Demo',
            hoverColor: Theme.of(context).primaryColor.withOpacity(0.2),
          ),
      ],
    );
  }

  Widget _buildTechStack(TextTheme textTheme, Color primaryColor) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.project.technologies
          .map(
            (tech) => Text(
              tech,
              style: textTheme.bodySmall?.copyWith(
                color: primaryColor,
                letterSpacing: 0.5,
              ),
            ),
          )
          .toList(),
    );
  }
}
