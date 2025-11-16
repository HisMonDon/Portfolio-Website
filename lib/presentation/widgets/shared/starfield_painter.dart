import 'package:flutter/material.dart';
import '../../../core/models/star_model.dart';

class StarfieldPainter extends CustomPainter {
  final List<Star> stars;
  final Paint _starPaint;

  StarfieldPainter({required this.stars}) : _starPaint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    for (final star in stars) {
      _starPaint.color = Colors.white.withAlpha(star.alpha);
      canvas.drawCircle(star.position, star.radius, _starPaint);
    }
  }

  @override
  bool shouldRepaint(covariant StarfieldPainter oldDelegate) {
    //for learnings sake oldDelegate is just the previous painter, and covarient is just meaning the same parameter type
    return true;
  }
}
