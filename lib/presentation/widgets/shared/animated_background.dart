import 'package:flutter/material.dart';
import 'star_model.dart';
import 'starfield_painter.dart';
import 'package:portfolio_website/core/constants/globals.dart' as globals;

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({Key? key}) : super(key: key);

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _controller;
  final int _numberOfStars = 200;
  bool _isInitialized = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.addListener(() {
      if (_isInitialized) {
        _updateStars();
        setState(() {});
      }
    });

    _controller.repeat();
  }

  void _initializeStars(Size bounds) {
    if (globals.starsList.isEmpty && bounds.width > 0 && bounds.height > 0) {
      for (int i = 0; i < _numberOfStars; i++) {
        globals.starsList.add(Star()..randomize(bounds));
      }
      _isInitialized = true;
    }
  }

  void _updateStars() {
    final bounds = context.size!;
    for (final star in globals.starsList) {
      star.velocity = Offset(
        star.velocity.dx,
        (star.velocity.dy + globals.scrollStarPusher * 0.1),
      );
      if (star.velocity.dx.abs() * 0.98 >= 0.2 ||
          star.velocity.dy.abs() * 0.98 >= 0.2) {
        star.velocity *= 0.98;
      }

      star.position += star.velocity;
      if (star.position.dx < 0) {
        star.position = Offset(bounds.width, star.position.dy);
      } else if (star.position.dx > bounds.width) {
        star.position = Offset(0, star.position.dy);
      }
      if (star.position.dy < 0) {
        star.position = Offset(star.position.dx, bounds.height);
      } else if (star.position.dy > bounds.height) {
        star.position = Offset(star.position.dx, 0);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (SizeChangedLayoutNotification notification) {
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            print('size changed');
            globals.starsList.clear();
            _isInitialized = false;
          });
        });
        return true;
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          _initializeStars(constraints.biggest);
          return CustomPaint(
            painter: StarfieldPainter(stars: globals.starsList),
            child: Container(),
          );
        },
      ),
    );
  }
}
