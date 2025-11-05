import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({Key? key}) : super(key: key);

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
              'The journey begins here...',
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
