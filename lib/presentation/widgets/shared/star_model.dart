import 'dart:ui';
import 'dart:math';
import 'package:portfolio_website/core/constants/globals.dart' as globals;

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
    double xvelocity = cos(angle) * (random.nextDouble() - 0.5) * 5;
    double yvelocity = sin(angle) * (random.nextDouble() - 0.5) * 5;
    position = Offset(bounds.width / 2, bounds.height / 2);
    radius = random.nextDouble() * 1.5 + 0.5;
    alpha = random.nextInt(234) + 20;
    velocity = Offset(xvelocity, yvelocity);
  }

  void update(double scrollAdd) {
    if (scrollStarPusher == scrollAdd) {
      return;
    }
    if (scrollStarPusher * -1 == scrollAdd) {
      velocity = Offset(velocity.dx, velocity.dy + 2 * scrollAdd);
      scrollStarPusher = scrollAdd;
      return;
    }
    velocity = Offset(velocity.dx, velocity.dy + scrollAdd);
    scrollStarPusher = scrollAdd;
    return;
  }
}
