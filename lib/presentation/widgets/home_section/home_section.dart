import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:portfolio_website/main.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 50),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              [
                    AutoSizeText(
                      "Hi, my name is",
                      style: GoogleFonts.mPlus1(
                        fontSize: 25,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                    ),
                    //const SizedBox(height: 3),
                    AutoSizeText(
                      "Chenyu Lu",
                      style: GoogleFonts.mPlus1(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 12),
                    AutoSizeText(
                      "I am a Grade 11 IB Student interested in Computer Science",
                      style: GoogleFonts.mPlus1(fontSize: 22),
                      maxLines: 2,
                    ),

                    const SizedBox(height: 40),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 20,
                        ),
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        "View My Projects",
                        style: GoogleFonts.mPlus1(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]
                  .animate(interval: 200.ms)
                  .fadeIn(duration: 600.ms, delay: 300.ms)
                  .slideY(begin: 0.5, end: 0.0),
        ),
        Expanded(
          child: Image.asset('images/app_grid.png', fit: BoxFit.contain),
        ),
      ],
    );
  }
}
