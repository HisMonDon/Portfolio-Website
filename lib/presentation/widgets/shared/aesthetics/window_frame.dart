import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';

/// A reusable "editor window" chrome: traffic-light dots + a label bar,
/// wrapping arbitrary content in a bordered panel. Used across the hero,
/// about-me portrait, and project cards so the whole site reads as one
/// consistent editor/terminal system.
class WindowFrame extends StatelessWidget {
  final String label;
  final Widget child;
  final EdgeInsetsGeometry? labelPadding;

  const WindowFrame({
    super.key,
    required this.label,
    required this.child,
    this.labelPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.panel,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.line),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 34,
            padding: labelPadding ?? const EdgeInsets.symmetric(horizontal: 14),
            decoration: const BoxDecoration(
              color: AppColors.panelAlt,
              border: Border(bottom: BorderSide(color: AppColors.line)),
            ),
            child: Row(
              children: [
                _dot(AppColors.trafficRed),
                _dot(AppColors.trafficYellow),
                _dot(AppColors.trafficGreen),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 12,
                      color: AppColors.fog,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(child: child),
        ],
      ),
    );
  }

  Widget _dot(Color color) => Container(
    width: 9,
    height: 9,
    margin: const EdgeInsets.only(right: 6),
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}

/// A code-comment-styled section eyebrow, e.g. `// about`.
class CommentEyebrow extends StatelessWidget {
  final String text;
  const CommentEyebrow({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      '// $text',
      style: GoogleFonts.jetBrainsMono(
        fontSize: 15,
        color: AppColors.string,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
