import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';

class ContactBar extends StatelessWidget {
  const ContactBar({super.key});

  Future<void> _openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'error, cant launch url $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _ContactCard(
              eyebrow: 'version control',
              title: 'GitHub',
              action: 'open',
              icon: Image.asset('images/contact_icons/1.png'),
              onTap: () => _openLink('https://github.com/HisMonDon'),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: _ContactCard(
              eyebrow: 'network',
              title: 'LinkedIn',
              action: 'connect',
              icon: Image.asset('images/contact_icons/2.png'),
              onTap: () =>
                  _openLink('https://www.linkedin.com/in/chenyu-lu-53b09938a/'),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: _ContactCard(
              eyebrow: 'direct',
              title: 'Email',
              action: 'send',
              icon: const Icon(
                Icons.email_outlined,
                color: AppColors.keyword,
                size: 22,
              ),
              onTap: () => _openLink('mailto:eric.luchenyu@gmail.com'),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final String eyebrow;
  final String title;
  final String action;
  final Widget icon;
  final VoidCallback onTap;

  const _ContactCard({
    required this.eyebrow,
    required this.title,
    required this.action,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.panel,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _isHovered
                  ? AppColors.keyword.withOpacity(0.6)
                  : AppColors.line,
              width: 1.2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SizedBox(height: 20, width: 20, child: widget.icon),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.eyebrow,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 10.5,
                        color: AppColors.fog,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.panelAlt,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: _isHovered ? AppColors.keyword : AppColors.line,
                      ),
                    ),
                    child: Text(
                      widget.action,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w600,
                        color: _isHovered
                            ? AppColors.keyword
                            : AppColors.string,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
