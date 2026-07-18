import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A cold, android-diagnostic boot sequence (Detroit: Become Human-style)
/// shown once over the real content on first load, then faded out.
class BootScreen extends StatefulWidget {
  final Widget child;
  const BootScreen({super.key, required this.child});

  @override
  State<BootScreen> createState() => _BootScreenState();
}

class _BootScreenState extends State<BootScreen>
    with SingleTickerProviderStateMixin {
  // Kept under 3s total including the fade-out.
  static const _loadDuration = Duration(milliseconds: 2300);
  static const _fadeDuration = Duration(milliseconds: 500);

  late final AnimationController _progress;
  bool _fadingOut = false;
  bool _removed = false;

  @override
  void initState() {
    super.initState();
    _progress = AnimationController(vsync: this, duration: _loadDuration)
      ..forward();
    Future.delayed(_loadDuration, () {
      if (!mounted) return;
      setState(() => _fadingOut = true);
      Future.delayed(_fadeDuration, () {
        if (mounted) setState(() => _removed = true);
      });
    });
  }

  @override
  void dispose() {
    _progress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (!_removed)
          IgnorePointer(
            child: AnimatedOpacity(
              opacity: _fadingOut ? 0 : 1,
              duration: _fadeDuration,
              curve: Curves.easeOut,
              child: _BootOverlay(progress: _progress),
            ),
          ),
      ],
    );
  }
}

class _BootOverlay extends StatelessWidget {
  final Animation<double> progress;
  const _BootOverlay({required this.progress});

  static const _accent = Color(0xFF7FE7F5);
  static const _statusLines = [
    'CHECKING SYSTEMS',
    'LOADING ASSETS',
    'COMPILING VIEWS',
    'ESTABLISHING LINK',
    'READY',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF040608),
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: progress,
        builder: (context, _) {
          final t = progress.value.clamp(0.0, 1.0);
          final percent = (t * 100).floor();
          final lineIndex = (t * (_statusLines.length - 1))
              .floor()
              .clamp(0, _statusLines.length - 1);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 160,
                height: 160,
                child: CustomPaint(
                  painter: _RingPainter(t),
                  child: Center(
                    child: Text(
                      '$percent%',
                      style: GoogleFonts.orbitron(
                        color: _accent,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'CHENYU LU',
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 6,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _statusLines[lineIndex],
                style: GoogleFonts.orbitron(
                  color: _accent.withOpacity(0.7),
                  fontSize: 11,
                  letterSpacing: 3,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double t;
  _RingPainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2 - 6;

    final track = Paint()
      ..color = Colors.white.withOpacity(0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(center, radius, track);

    final sweep = 2 * math.pi * t;
    final arc = Paint()
      ..color = _BootOverlay._accent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweep,
      false,
      arc,
    );

    final angle = -math.pi / 2 + sweep;
    final tip = Offset(
      center.dx + radius * math.cos(angle),
      center.dy + radius * math.sin(angle),
    );
    final marker = Paint()..color = _BootOverlay._accent;
    canvas.save();
    canvas.translate(tip.dx, tip.dy);
    canvas.rotate(math.pi / 4);
    canvas.drawRect(const Rect.fromLTWH(-4, -4, 8, 8), marker);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) => oldDelegate.t != t;
}
