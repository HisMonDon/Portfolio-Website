import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  final GlobalKey? homeKey;
  final GlobalKey? aboutMeKey;

  const Footer({super.key, this.homeKey, this.aboutMeKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: Colors.black.withOpacity(0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFooterLink(
                context,
                "Home",
                onPressed: () {
                  if (homeKey != null) {
                    scrollToSection(homeKey!);
                  } else {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (route) => false,
                    );
                  }
                },
              ),
              _buildFooterLink(
                context,
                "Projects",
                onPressed: () {
                  Navigator.pushNamed(context, '/projects');
                },
              ),
              _buildFooterLink(
                context,
                "About",
                onPressed: () {
                  if (aboutMeKey != null) {
                    scrollToSection(aboutMeKey!);
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "© 2025 Chenyu Lu. All Rights Reserved.",
            style: GoogleFonts.poppins(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 14,
            ),
          ),
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
          textStyle: GoogleFonts.poppins(fontSize: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
        child: Text(text),
      ),
    );
  }
}
