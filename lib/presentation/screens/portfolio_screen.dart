import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_website/presentation/widgets/shared/animated_background.dart';
import 'package:portfolio_website/core/constants/globals.dart' as globals;
import 'dart:async';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

final projectsKey = new GlobalKey();
final achievementsKey = new GlobalKey();
final skillsKey = new GlobalKey();

class _PortfolioScreenState extends State<PortfolioScreen> {
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

  void scrollToSection(GlobalKey key) {
    globals.scrollStarPusher = 5;
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOutCirc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text("Chenyu Lu"),
        ),
        toolbarHeight: 69,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onTap: () {
                  scrollToSection(projectsKey);
                },
                child: const Text("Projects", style: TextStyle(fontSize: 17)),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onTap: () {
                  scrollToSection(skillsKey);
                },
                child: const Text("Skills", style: TextStyle(fontSize: 17)),
              ),
            ),
          ),
          SizedBox(width: 30),
        ],
      ),
      body: Stack(
        children: [
          const AnimatedBackground(),
          ListView(
            controller: _scrollController,
            children: [
              // HeroSection(),
              // AboutSection(),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Text(
                    'placeholder lol',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              SizedBox(
                key: projectsKey,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Text(
                    'projects',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              SizedBox(
                key: achievementsKey,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Text(
                    'achievements',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              SizedBox(
                key: skillsKey,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Text(
                    'skills',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
