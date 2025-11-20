import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_website/core/models/awards_model.dart';
import 'package:portfolio_website/presentation/widgets/awards_section/contests_section.dart';
import 'package:portfolio_website/presentation/widgets/awards_section/extracurriculars_section.dart';
import 'package:portfolio_website/presentation/widgets/shared/aesthetics/animated_background.dart';
import 'package:portfolio_website/core/constants/globals.dart' as globals;
import 'dart:async';
import 'package:portfolio_website/presentation/widgets/shared/aesthetics/glow_app_bar.dart';
import 'package:portfolio_website/presentation/widgets/shared/footer.dart';

class AwardsScreen extends StatefulWidget {
  const AwardsScreen({Key? key}) : super(key: key);

  @override
  _AwardsScreenState createState() => _AwardsScreenState();
}

class _AwardsScreenState extends State<AwardsScreen> {
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollEndTimer;

  // State for sorting is now managed here
  String _currentSortOption = 'Relevance';
  late List<Award> _mainAwards;

  final _awardsSection = AwardsSection();
  final _extracurricularsSection = ExtracurricularsSection();

  // Award lists are now stored here
  final List<Award> _dateSortedAwards = [
    Award(
      name: 'CaYPT (Canadian Young Physics Tournament)',
      year: '2025',
      description: 'Silver Medalist in Canada',
    ),
    Award(name: 'AP Physics 1', year: '2025', description: 'Score of 5'),
    Award(name: 'AP Chemistry', year: '2025', description: 'Score of 5'),
    Award(name: 'AP Computer Science', year: '2025', description: 'Score of 5'),
    Award(name: 'OAPT Physics Contest', year: '2025', description: 'Top 10%'),
    Award(
      name: 'CEMC Galois Contest',
      year: '2025',
      description: 'Distinction (Top 25%)',
    ),
    Award(
      name: 'CEMC Fermat Contest',
      year: '2025',
      description: 'Distinction (Top 25%)',
    ),
    Award(
      name: 'Canadian Intermediate Mathematics Contest (CIMC)',
      year: '2024',
      description: 'Honor Roll (< Top 2%)',
    ),
    Award(
      name: 'Canadian Computing Contest Junior',
      year: '2024',
      description: 'Distinction (Top 25%)',
    ),
    Award(
      name: 'CEMC Fryer Contest',
      year: '2023',
      description: 'Distinction (Top 25%)',
    ),
    Award(
      name: 'CEMC Cayley Contest',
      year: '2023',
      description: 'Distinction (Top 25%)',
    ),
    Award(
      name: 'Canadian Intermediate Mathematics Contest (CIMC)',
      year: '2023',
      description: 'Distinction (Top 25%)',
    ),
  ];

  final List<Award> _relevanceAwards = [
    Award(
      name: 'CaYPT (Canadian Young Physics Tournament)',
      year: '2025',
      description: 'Silver Medalist in Canada',
    ),
    Award(
      name: 'Canadian Intermediate Mathematics Contest (CIMC)',
      year: '2024',
      description: 'Honor Roll (< Top 2%)',
    ),
    Award(name: 'AP Physics 1', year: '2025', description: 'Score of 5'),
    Award(name: 'AP Chemistry', year: '2025', description: 'Score of 5'),
    Award(name: 'AP Computer Science', year: '2025', description: 'Score of 5'),
    Award(
      name: 'Canadian Computing Contest Junior',
      year: '2024',
      description: 'Distinction (Top 25%)',
    ),
    Award(name: 'OAPT Physics Contest', year: '2025', description: 'Top 10%'),
    Award(
      name: 'CEMC Galois Contest',
      year: '2025',
      description: 'Distinction (Top 25%)',
    ),
    Award(
      name: 'CEMC Fermat Contest',
      year: '2025',
      description: 'Distinction (Top 25%)',
    ),
    Award(
      name: 'CEMC Fryer Contest',
      year: '2023',
      description: 'Distinction (Top 25%)',
    ),
    Award(
      name: 'CEMC Cayley Contest',
      year: '2023',
      description: 'Distinction (Top 25%)',
    ),
    Award(
      name: 'Canadian Intermediate Mathematics Contest (CIMC)',
      year: '2023',
      description: 'Distinction (Top 25%)',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _mainAwards = List.from(_relevanceAwards);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    _scrollEndTimer?.cancel();
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      globals.scrollStarPusher = 5;
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      globals.scrollStarPusher = -5;
    }
    _scrollEndTimer = Timer(const Duration(milliseconds: 150), () {
      globals.scrollStarPusher = 0;
    });
  }

  void _sortAwards(String? newSortOption) {
    if (newSortOption == null) return;
    setState(() {
      _currentSortOption = newSortOption;
      if (newSortOption == 'Relevance') {
        _mainAwards = List.from(_relevanceAwards);
      } else if (newSortOption == 'Date') {
        _mainAwards = List.from(_dateSortedAwards);
      }
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
      appBar: GlowAppBar(
        toolbarHeight: 69,
        glowColor: const Color.fromARGB(255, 255, 215, 0),
        title: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text("Chenyu Lu"),
        ),
        actions: [
          _buildAppBarAction(
            "Home",
            () => Navigator.pushNamedAndRemoveUntil(
              context,
              '/',
              (route) => false,
            ),
          ),
          _buildAppBarAction(
            "Projects",
            () => Navigator.pushNamed(context, '/projects'),
          ),
          _buildAppBarAction("Achievements", () {}),
          _buildAppBarAction("Skills", () {}),
          const SizedBox(width: 30),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(117, 255, 215, 0),
                  Color.fromARGB(255, 6, 2, 20),
                ],
                stops: [0.0, 0.25],
              ),
            ),
          ),
          const AnimatedBackground(),
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              ..._awardsSection.buildSlivers(
                context: context,
                currentSortOption: _currentSortOption,
                awards: _mainAwards,
                onSortChanged: _sortAwards,
              ),
              ..._extracurricularsSection.buildSlivers(context),
              SliverToBoxAdapter(child: Footer()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarAction(String title, VoidCallback onTap) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onTap,
            child: Text(title, style: const TextStyle(fontSize: 17)),
          ),
        ),
      ),
    );
  }
}
