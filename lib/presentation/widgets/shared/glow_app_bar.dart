import 'package:flutter/material.dart';

class GlowAppBar extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final Widget title;
  final double toolbarHeight;
  final Color? shadowColor;
  final double? scrolledUnderElevation;

  const GlowAppBar({
    Key? key,
    required this.actions,
    required this.title,
    this.toolbarHeight = 69.0,
    this.shadowColor,
    this.scrolledUnderElevation,
  }) : super(key: key);

  @override
  _GlowAppBarState createState() => _GlowAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}

class _GlowAppBarState extends State<GlowAppBar> {
  Offset _mousePosition = Offset.zero;
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final glowColor = const Color.fromARGB(255, 33, 150, 243);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      onHover: (event) => setState(() => _mousePosition = event.localPosition),
      child: AppBar(
        title: widget.title,
        actions: widget.actions,
        toolbarHeight: widget.toolbarHeight,
        shadowColor: widget.shadowColor,
        scrolledUnderElevation: widget.scrolledUnderElevation,
        centerTitle: false,
        flexibleSpace: Stack(
          children: [
            if (_isHovering)
              Positioned(
                top: _mousePosition.dy - 20,
                left: _mousePosition.dx - 26,
                child: Container(
                  width: 80,
                  height: 80,
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
          ],
        ),
      ),
    );
  }
}
