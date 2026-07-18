import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';
import 'package:portfolio_website/presentation/widgets/shared/aesthetics/window_frame.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const CommentEyebrow(text: 'about'),
                const SizedBox(height: 12),
                AutoSizeText(
                  "About Me",
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge?.copyWith(fontSize: 44),
                  maxLines: 1,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: 640,
                  child: Text.rich(
                    TextSpan(
                      style: GoogleFonts.inter(
                        fontSize: 17,
                        height: 1.75,
                        color: AppColors.fog,
                      ),
                      children: [
                        const TextSpan(text: "Hey, my name is "),
                        TextSpan(
                          text: "Chenyu Lu",
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: AppColors.ink,
                          ),
                        ),
                        const TextSpan(
                          text:
                              ". \n\nI'm a high school IB student at St.Robert "
                              "Catholic High School interested in pursuing "
                              "computer science. I'm really passionate about "
                              "coding, and I love building projects that "
                              "positively impact people in a variety of "
                              "fields using my skills. \n\n"
                              "Do not hesitate to connect view my open "
                              "source projects on GitHub, connect with me on "
                              "LinkedIn, or send me an email!",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsetsGeometry.fromLTRB(40, 0, 0, 0),
              child: WindowFrame(
                label: 'portrait.jpg',
                child: SizedBox(
                  height: 500,
                  child: Image.asset(
                    'images/portfolio_image.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.15, end: 0.0);
  }
}
