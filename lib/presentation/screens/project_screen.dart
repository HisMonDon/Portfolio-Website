import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_website/presentation/screens/portfolio_screen.dart';
import 'package:portfolio_website/presentation/widgets/home_section/about_me.dart';
import 'package:portfolio_website/presentation/widgets/projects_section/projects_section.dart';
import 'package:portfolio_website/presentation/widgets/shared/animated_background.dart';
import 'package:portfolio_website/core/constants/globals.dart' as globals;
import 'dart:async';
import 'package:portfolio_website/presentation/widgets/home_section/home_section.dart';
import 'package:portfolio_website/presentation/widgets/shared/glow_app_bar.dart';
import 'package:portfolio_website/presentation/widgets/shared/sizedchanged.dart';

import 'package:portfolio_website/core/constants/utils.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollEndTimer;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    //print('Scroll offset: ${_scrollController.position.pixels}');
    _scrollEndTimer?.cancel();

    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      //print('Scrolling up');
      globals.scrollStarPusher = 5;
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      //print('Scrolling down');
      globals.scrollStarPusher = -5;
    }

    _scrollEndTimer = Timer(const Duration(milliseconds: 150), () {
      globals.scrollStarPusher = 0;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _scrollEndTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=======================================
      //appbar
      //=======================================
      appBar: GlowAppBar(
        scrolledUnderElevation: 4.0,
        shadowColor: Colors.black.withOpacity(0.5),
        toolbarHeight: 69,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PortfolioScreen(),
                      ),
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
                    scrollToSection(projectsKey);
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
                  onTap: () {
                    scrollToSection(achievementsKey);
                  },
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
                  onTap: () {
                    scrollToSection(skillsKey);
                  },
                  child: const Text("Skills", style: TextStyle(fontSize: 17)),
                ),
              ),
            ),
          ),
          SizedBox(width: 30),
        ],
      ),

      //===============================================================================
      //BODY
      //===============================================================================
      body: SizedChanged(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(117, 100, 255, 219),
                    Color.fromARGB(255, 6, 2, 20),
                  ],
                  stops: [0.0, 0.25],
                ),
              ),
            ),
            const AnimatedBackground(),
            ProjectsSection(),
          ],
        ),
      ),
    );
  }
}
