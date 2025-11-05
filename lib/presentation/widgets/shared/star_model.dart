import 'dart:ui';
import 'dart:math';

class Star {
  Offset position;
  double radius;
  int alpha;
  Offset velocity;

  Star()
    : position = Offset.zero,
      radius = 0,
      alpha = 0,
      velocity = Offset.zero;

  void randomize(Size bounds) {
    final random = Random();
    final angle = random.nextDouble() * 2 * pi;
    position = Offset(bounds.width / 2, bounds.height / 2);
    radius = random.nextDouble() * 1.5 + 0.5;
    alpha = random.nextInt(234) + 20;
    velocity = Offset(
      cos(angle) * (random.nextDouble() - 0.5) * 5,
      sin(angle) * (random.nextDouble() - 0.5) * 5,
    );
  }
}
