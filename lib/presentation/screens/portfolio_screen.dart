import 'package:flutter/material.dart';
import 'package:portfolio_website/presentation/widgets/shared/animated_background.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AnimatedBackground(),

          ListView(
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
