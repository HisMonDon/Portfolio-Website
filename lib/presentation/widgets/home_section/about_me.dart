import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
//import 'package:portfolio_website/main.dart';
import 'package:widget_mask/widget_mask.dart';
import 'package:portfolio_website/presentation/widgets/contact_section/contact_bar.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 30),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    "About Me",
                    style: Theme.of(
                      context,
                    ).textTheme.displayLarge?.copyWith(fontSize: 48),
                    maxLines: 1,
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: 700,
                    child: Text.rich(
                      TextSpan(
                        style: GoogleFonts.mPlus1(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: const Color.fromARGB(255, 214, 213, 213),
                        ),
                        children: [
                          TextSpan(text: "Hey, my name is "),
                          TextSpan(
                            text: "Chenyu Lu",
                            style: GoogleFonts.mPlus1(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 214, 213, 213),
                            ),
                          ),
                          TextSpan(
                            text:
                                ". \n\nI'm an high school IB student at St.Robert Catholic High School interested in pursuing computer science. I'm really passionate about coding, and I love building projects that positively impact people in a variety of fields using my skills. \n\n",
                          ),
                          TextSpan(
                            text:
                                "Do not hesitate to connect view my open source projects on GitHub, connect with me on LinkedIn, or send me an email!",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 400,
                constraints: const BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('images/portfolio_image.jpg'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 80),
          ],
        ),
      ],
    );
  }
}
