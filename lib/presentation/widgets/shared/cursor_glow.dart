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
    final glowColor = const Color.fromARGB(255, 33, 150, 243);

    return MouseRegion(
      //cursor: SystemMouseCursors.basic,
      onHover: (event) {
        setState(() {
          _mousePosition = event.position;
          _isHoveringAppBar =
              _mousePosition.dy < widget.appBarHeight + 40 &&
              _mousePosition.dy > widget.appBarHeight; //raddii of glows
        });
      },
      onExit: (_) {
        setState(() {
          _isHoveringAppBar = false;
        });
      },
      child: ClipRect(
        child: Stack(
          children: [
            widget.child,
            ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 69 / MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    if (_isHoveringAppBar)
                      Positioned(
                        top: _mousePosition.dy - 20, //center glow
                        left: _mousePosition.dx - 26,
                        child: IgnorePointer(
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: glowColor.withOpacity(0.7),
                                  blurRadius: 60,
                                  spreadRadius: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
