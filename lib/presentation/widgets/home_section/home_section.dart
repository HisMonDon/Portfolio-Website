import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
//import 'package:portfolio_website/main.dart';
import 'package:widget_mask/widget_mask.dart';
import 'package:portfolio_website/presentation/widgets/contact_section/contact_bar.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(left: 150.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  [
                        AutoSizeText(
                          " Hi, my name is",
                          style: GoogleFonts.mPlus1(
                            fontSize: 25,
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                        ),
                        //const SizedBox(height: 3),
                        /*AutoSizeText(
                          "Chenyu Lu",
                          style: GoogleFonts.mPlus1(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          maxLines: 1,
                        ),*/
                        WidgetMask(
                          blendMode: BlendMode.srcATop,
                          childSaveLayer: true,
                          mask: Image(
                            image: AssetImage('images/name_mask.png'),
                            fit: BoxFit.cover,
                          ),

                          child: AutoSizeText(
                            "Chenyu Lu",
                            style: GoogleFonts.mPlus1(
                              fontWeight: FontWeight.bold,
                              fontSize: 70,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              decoration: TextDecoration.none,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.5),
                          child: ContactBar(),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: AutoSizeText(
                            "I am a Grade 11 IB Student interested in Computer Science",
                            style: GoogleFonts.mPlus1(fontSize: 22),
                            maxLines: 2,
                          ),
                        ),

                        const SizedBox(height: 40),

                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 20,
                            ),
                            backgroundColor: const Color.fromARGB(
                              255,
                              51,
                              124,
                              167,
                            ),
                            foregroundColor: Colors.white,
                            side: BorderSide(color: Colors.transparent),
                          ),
                          child: Text(
                            "More about me",
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
          ),
        ),
        Expanded(
          flex: 5,
          child: SizedBox(
            height: 1400,
            width: 1400,
            child: Image.asset('images/app_grid.png', fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }
}
