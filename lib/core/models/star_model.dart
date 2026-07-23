import 'dart:ui';
import 'dart:math';

class Star {
  Offset position;
  double radius;
  int alpha;
  Offset velocity;
  double scrollStarPusher;
  Star()
    : position = Offset.zero,
      radius = 0,
      alpha = 0,
      velocity = Offset.zero,
      scrollStarPusher = 0;

  void randomize(Size bounds) {
    final random = Random();
    final angle = random.nextDouble() * 2 * pi;
    final speed = random.nextDouble() * 40 + 0.1;
    double xvelocity = cos(angle) * speed;
    double yvelocity = sin(angle) * speed;
    position = Offset(bounds.width / 2, bounds.height / 2);
    radius = random.nextDouble() * 1.5 + 0.5;
    alpha = random.nextInt(200) + 55;
    velocity = Offset(xvelocity, yvelocity);
  }
}
