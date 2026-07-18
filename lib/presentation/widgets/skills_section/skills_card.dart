import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/core/models/skills_model.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';

class SkillsCard extends StatefulWidget {
  final Skills skill;
  const SkillsCard({super.key, required this.skill});

  @override
  State<SkillsCard> createState() => _SkillsCardState();
}

class _SkillsCardState extends State<SkillsCard> {
  bool _isHovered = false;

  String get _yearsPill {
    final match = RegExp(r'\d+').firstMatch(widget.skill.time);
    return match == null ? widget.skill.time : '${match.group(0)}y';
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Animate(
        effects: [
          FadeEffect(duration: 600.ms, curve: Curves.easeOut),
          ScaleEffect(
            begin: const Offset(0.95, 0.95),
            curve: Curves.easeOutBack,
          ),
        ],
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.panel,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _isHovered ? AppColors.keyword.withOpacity(0.6) : AppColors.line,
              width: 1.2,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 34,
                width: 34,
                child: Image.asset(widget.skill.imageUrl),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  widget.skill.name,
                  style: textTheme.titleLarge?.copyWith(fontSize: 17),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.panelAlt,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.line),
                ),
                child: Text(
                  _yearsPill,
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 12.5,
                    color: AppColors.string,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
