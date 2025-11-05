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
    position = Offset(
      random.nextDouble() * bounds.width,
      random.nextDouble() * bounds.height,
    );
    radius = random.nextDouble() * 1.5 + 0.5;
    alpha = random.nextInt(234) + 20;
    velocity = Offset(
      (random.nextDouble() - 0.5) * 0.2,
      (random.nextDouble() - 0.5) * 0.2,
    );
  }
}
