import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portfolio_website/main.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:
          [
                Text(
                  "Hi, my name is",
                  style: GoogleFonts.mPlus1(fontSize: 25, color: Colors.grey),
                ),
                //const SizedBox(height: 3),
                Text(
                  "Chenyu Lu",
                  style: GoogleFonts.mPlus1(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "I am a Grade 11 IB Student interested in Computer Science",
                  style: GoogleFonts.mPlus1(fontSize: 22),
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
    );
  }
}
