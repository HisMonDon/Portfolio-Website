import 'package:flutter/material.dart';

class CursorGlow extends StatefulWidget {
  final Widget child;
  final double appBarHeight;

  const CursorGlow({Key? key, required this.child, this.appBarHeight = 80.0})
    : super(key: key);

  @override
  _CursorGlowState createState() => _CursorGlowState();
}

class _CursorGlowState extends State<CursorGlow> {
  Offset _mousePosition = Offset.zero;
  bool _isHoveringAppBar = false;

  @override
  Widget build(BuildContext context) {
    final glowColor = const Color.fromARGB(255, 102, 172, 253);

    return MouseRegion(
      cursor: _isHoveringAppBar
          ? SystemMouseCursors.none
          : SystemMouseCursors.basic,
      onHover: (event) {
        setState(() {
          _mousePosition = event.position;
          _isHoveringAppBar = _mousePosition.dy < widget.appBarHeight;
        });
      },
      onExit: (_) {
        setState(() {
          _isHoveringAppBar = false;
        });
      },
      child: Stack(
        children: [
          widget.child,

          if (_isHoveringAppBar)
            Positioned(
              top: _mousePosition.dy - 15, //center glow
              left: _mousePosition.dx - 15,
              child: IgnorePointer(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: glowColor.withOpacity(0.5),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                      BoxShadow(
                        color: glowColor.withOpacity(0.8),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
