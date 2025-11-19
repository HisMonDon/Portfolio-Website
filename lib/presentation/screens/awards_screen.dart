import 'package:flutter/material.dart';
import 'package:portfolio_website/presentation/widgets/awards_section/contests_section.dart';
import 'package:portfolio_website/presentation/widgets/awards_section/extracurriculars_section.dart';
import 'package:portfolio_website/presentation/widgets/shared/aesthetics/animated_background.dart';
import 'package:portfolio_website/presentation/widgets/shared/aesthetics/glow_app_bar.dart';
import 'package:portfolio_website/presentation/widgets/shared/sizedchanged.dart';

class AwardsScreen extends StatefulWidget {
  const AwardsScreen({Key? key}) : super(key: key);

  @override
  _AwardsScreenState createState() => _AwardsScreenState();
}

class _AwardsScreenState extends State<AwardsScreen> {
  final AwardsSection awardsSection = AwardsSection();
  final ExtracurricularsSection extracurricularsSection =
      ExtracurricularsSection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlowAppBar(
        toolbarHeight: 69,
        glowColor: const Color.fromARGB(255, 255, 215, 0),
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text("Chenyu Lu"),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (route) => false,
                    );
                  },
                  child: const Text("Home", style: TextStyle(fontSize: 17)),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/projects');
                  },
                  child: const Text("Projects", style: TextStyle(fontSize: 17)),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Achievements",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text("Skills", style: TextStyle(fontSize: 17)),
                ),
              ),
            ),
          ),
          SizedBox(width: 30),
        ],
      ),
      body: SizedChanged(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(117, 255, 215, 0),
                    const Color.fromARGB(255, 6, 2, 20),
                  ],
                  stops: [0.0, 0.25],
                ),
              ),
            ),
            const AnimatedBackground(),
            CustomScrollView(
              slivers: [
                ...awardsSection.buildSlivers(context),
                SliverToBoxAdapter(child: const SizedBox(height: 40)),
                ...extracurricularsSection.buildSlivers(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
