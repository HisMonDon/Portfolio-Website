import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_website/presentation/widgets/shared/animated_background.dart';

import 'package:portfolio_website/core/constants/globals.dart' as globals;

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  ScrollController _scrollController = ScrollController();

  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    //print('Scroll offset: ${_scrollController.position.pixels}');

    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      globals.scrollStarPusher = 0;
    }

    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      //print('Scrolling up');
      globals.scrollStarPusher = -5;
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      //print('Scrolling down');
      globals.scrollStarPusher = 5;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Text(
                    'next section',
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
