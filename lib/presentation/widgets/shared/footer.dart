import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/core/constants/utils.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';

/// A slim status-bar style footer, styled after a code editor's bottom bar.
class Footer extends StatelessWidget {
  final GlobalKey? homeKey;
  final GlobalKey? aboutMeKey;

  const Footer({super.key, this.homeKey, this.aboutMeKey});

  @override
  Widget build(BuildContext context) {
    final mono = GoogleFonts.jetBrainsMono(fontSize: 13, color: AppColors.fog);

    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.panel,
        border: Border(top: BorderSide(color: AppColors.line)),
      ),
      child: Row(
        children: [
          Text('main ✓ built with Flutter', style: mono),
          const Spacer(),
          _buildFooterLink(
            context,
            "home",
            onPressed: () {
              if (homeKey != null) {
                scrollToSection(homeKey!);
              } else {
                Navigator.pushReplacementNamed(context, '/');
              }
            },
          ),
          _buildFooterLink(
            context,
            "projects",
            onPressed: () => Navigator.pushReplacementNamed(context, '/projects'),
          ),
          _buildFooterLink(
            context,
            "contact",
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          const SizedBox(width: 12),
          Text('© 2026 Chenyu Lu', style: mono),
        ],
      ),
    );
  }

  Widget _buildFooterLink(
    BuildContext context,
    String text, {
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: AppColors.fog,
          textStyle: GoogleFonts.jetBrainsMono(fontSize: 13),
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(text),
      ),
    );
  }
}
