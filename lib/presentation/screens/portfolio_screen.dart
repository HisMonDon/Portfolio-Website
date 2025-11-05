import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_website/presentation/widgets/shared/animated_background.dart';

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
    print('Scroll offset: ${_scrollController.position.pixels}');

    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      print('Reached end of list');
    }

    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      print('Scrolling up');
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      print('Scrolling down');
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
