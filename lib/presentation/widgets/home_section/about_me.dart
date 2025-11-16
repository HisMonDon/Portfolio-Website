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
      children: [
        SizedBox(height: 30),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    "About Me",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                                ". \n\nI'm an high school IB student at St.Robert Catholic High School interested in pursuing computer science. I'm really passionate about Physics, Chemistry, and Coding, and I love building projects that positively impact people in a variety of fields using my skills. \n\nCurrently, I’m focusing on my academics while building practical projects and preparing for contests.",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 600,
                child: FractionallySizedBox(
                  widthFactor: 0.80,
                  //heightFactor: 0.90,
                  child: Container(
                    //child: Image.asset('images/portfolio_image.jpg', ),
                    height: 700,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('images/portfolio_image.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
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
