import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('CHENYU LU', style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 16),
            Text(
              "Hi, I'm Chenyu Lu",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
