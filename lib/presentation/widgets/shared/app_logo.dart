import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key, this.size = 30}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Text(
        "Chenyu Lu",
        style: GoogleFonts.mPlus1(
          fontSize: 25,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
