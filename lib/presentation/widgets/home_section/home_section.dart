import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Hi, my name is", style: GoogleFonts.mPlus1(fontSize: 20))
            .animate()
            .fadeIn(delay: 300.ms, duration: 2000.ms)
            .slideY(begin: -1, end: 0.0),
        Text("Chenyu Lu", style: GoogleFonts.mPlus1(fontSize: 50))
            .animate()
            .fadeIn(delay: 300.ms, duration: 2000.ms)
            .slideY(begin: 1, end: 0.0),
      ],
    );
  }
}
