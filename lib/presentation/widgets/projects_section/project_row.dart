import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/core/constants/utils.dart';
import 'package:portfolio_website/core/models/project_model.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';
import 'package:portfolio_website/presentation/screens/project_detail_screen.dart';

/// A single project rendered as a file-listing row (à la a code editor's
/// file explorer), rather than a card. Clicking a row with a detail page
/// opens it as a new "file".
class ProjectRow extends StatefulWidget {
  final Project project;
  const ProjectRow({super.key, required this.project});

  @override
  State<ProjectRow> createState() => _ProjectRowState();
}

class _ProjectRowState extends State<ProjectRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final clickable = project.hasDetailPage;
    final fileName = projectFileName(project);
    final accent = projectAccentColor(project);

    return MouseRegion(
      cursor: clickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: clickable ? (_) => setState(() => _isHovered = true) : null,
      onExit: clickable ? (_) => setState(() => _isHovered = false) : null,
      child: GestureDetector(
        onTap: clickable
            ? () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ProjectDetailScreen(project: project),
                ),
              )
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.panelAlt : Colors.transparent,
            border: const Border(bottom: BorderSide(color: AppColors.line)),
            boxShadow: _isHovered
                ? [BoxShadow(color: accent.withOpacity(0.06), blurRadius: 12)]
                : null,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final showMeta = constraints.maxWidth > 640;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 14),
                    decoration: BoxDecoration(
                      color: accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: showMeta ? 230 : null,
                    child: Text(
                      fileName,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: _isHovered ? AppColors.keyword : AppColors.ink,
                      ),
                    ),
                  ),
                  if (showMeta) ...[
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        project.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 13.5,
                          color: AppColors.fog,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    if (project.technologies.isNotEmpty)
                      SizedBox(
                        width: 220,
                        child: Text(
                          project.technologies.join(' · ').toLowerCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 12,
                            color: AppColors.string,
                          ),
                        ),
                      ),
                  ],
                  const SizedBox(width: 16),
                  Icon(
                    clickable ? Icons.arrow_forward : Icons.schedule,
                    size: 16,
                    color: clickable
                        ? (_isHovered ? AppColors.keyword : AppColors.fog)
                        : AppColors.fog.withOpacity(0.5),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
