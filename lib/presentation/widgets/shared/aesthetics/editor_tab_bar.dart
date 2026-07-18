import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';

/// A single nav destination, rendered as an open editor tab.
class EditorTab {
  final String label;
  final bool active;
  final VoidCallback onTap;

  /// When set, renders a small close "×" after the label — used for
  /// dynamically-opened tabs (e.g. a project's detail page) that aren't
  /// part of the permanent nav.
  final VoidCallback? onClose;

  const EditorTab({
    required this.label,
    required this.active,
    required this.onTap,
    this.onClose,
  });
}

/// App bar styled as a code editor's window chrome: traffic-light dots +
/// a window label on the left, nav destinations rendered as open file tabs
/// on the right.
class EditorTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<EditorTab> tabs;
  final String windowLabel;

  const EditorTabBar({
    super.key,
    required this.tabs,
    this.windowLabel = 'chenyu-lu — zsh',
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.panel,
        border: Border(bottom: BorderSide(color: AppColors.line)),
      ),
      child: Row(
        children: [
          const _TrafficLights(),
          const SizedBox(width: 16),
          Text(
            windowLabel,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 13,
              color: AppColors.fog,
            ),
          ),
          const Spacer(),
          for (final tab in tabs) _EditorTabItem(tab: tab),
        ],
      ),
    );
  }
}

class _TrafficLights extends StatelessWidget {
  const _TrafficLights();

  @override
  Widget build(BuildContext context) {
    Widget dot(Color color) => Container(
      width: 11,
      height: 11,
      margin: const EdgeInsets.only(right: 7),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );

    return Row(
      children: [
        dot(AppColors.trafficRed),
        dot(AppColors.trafficYellow),
        dot(AppColors.trafficGreen),
      ],
    );
  }
}

class _EditorTabItem extends StatefulWidget {
  final EditorTab tab;
  const _EditorTabItem({required this.tab});

  @override
  State<_EditorTabItem> createState() => _EditorTabItemState();
}

class _EditorTabItemState extends State<_EditorTabItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final active = widget.tab.active;
    final highlighted = active || _isHovered;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.tab.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: highlighted ? AppColors.panelAlt : Colors.transparent,
            border: Border(
              top: BorderSide(
                color: active ? AppColors.keyword : Colors.transparent,
                width: 2,
              ),
              left: const BorderSide(color: AppColors.line, width: 1),
            ),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.tab.label,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 14,
                  color: active ? AppColors.ink : AppColors.fog,
                  fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
              if (widget.tab.onClose != null) ...[
                const SizedBox(width: 10),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: widget.tab.onClose,
                    child: Icon(
                      Icons.close,
                      size: 14,
                      color: active
                          ? AppColors.fog
                          : AppColors.fog.withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
