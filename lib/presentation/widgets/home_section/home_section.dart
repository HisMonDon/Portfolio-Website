import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';
import 'package:portfolio_website/presentation/widgets/contact_section/contact_bar.dart';
import 'package:portfolio_website/presentation/widgets/shared/aesthetics/window_frame.dart';

import 'package:portfolio_website/core/constants/utils.dart';

class HomeSection extends StatefulWidget {
  final GlobalKey aboutMeKey;
  const HomeSection({Key? key, required this.aboutMeKey}) : super(key: key);

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  static const double _fallbackHeight = 420;

  final GlobalKey _leftColumnKey = GlobalKey();
  double _modelBoxHeight = _fallbackHeight;

  @override
  void initState() {
    super.initState();
    // One measurement after the first frame, plus a second delayed check to
    // catch any reflow once web fonts finish loading asynchronously.
    WidgetsBinding.instance.addPostFrameCallback(_measureLeftColumn);
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) _measureLeftColumn(Duration.zero);
    });
  }

  void _measureLeftColumn(Duration _) {
    if (!mounted) return;
    final renderObject = _leftColumnKey.currentContext?.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) return;
    final height = renderObject.size.height;
    if ((height - _modelBoxHeight).abs() > 0.5) {
      setState(() => _modelBoxHeight = height);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 40.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              key: _leftColumnKey,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  [
                        _TerminalCard(aboutMeKey: widget.aboutMeKey),
                        const SizedBox(height: 28),
                        const ContactBar(),
                      ]
                      .animate(interval: 150.ms)
                      .fadeIn(duration: 500.ms, delay: 200.ms)
                      .slideY(begin: 0.3, end: 0.0),
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            flex: 5,
            child: SizedBox(
              height: _modelBoxHeight,
              child: WindowFrame(
                label: 'wave.glb',
                child: const ModelViewer(
                  backgroundColor: Colors.transparent,
                  src: 'assets/assets/models/wave.glb',
                  alt: 'A 3D figure waving toward the page content',
                  cameraControls: true,
                  disableZoom: true,
                  autoPlay: true,
                ),
              ),
            ).animate().fadeIn(duration: 700.ms, delay: 400.ms),
          ),
        ],
      ),
    );
  }
}

class _TerminalCard extends StatelessWidget {
  final GlobalKey aboutMeKey;
  const _TerminalCard({required this.aboutMeKey});

  @override
  Widget build(BuildContext context) {
    final mono = GoogleFonts.jetBrainsMono();

    TextSpan prompt(String cmd) => TextSpan(
      children: [
        TextSpan(
          text: '\$ ',
          style: mono.copyWith(color: AppColors.string, fontSize: 16),
        ),
        TextSpan(
          text: '$cmd\n',
          style: mono.copyWith(color: AppColors.fog, fontSize: 16),
        ),
      ],
    );

    return WindowFrame(
      label: 'zsh — chenyu@dev',
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text.rich(prompt('whoami')),
            Text(
              'Chenyu Lu',
              style: mono.copyWith(
                color: AppColors.keyword,
                fontSize: 44,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 18),
            Text.rich(prompt('cat role.txt')),
            Text(
              'Student developer building full-stack apps, games,\nand physics tools.',
              style: mono.copyWith(
                color: AppColors.ink,
                fontSize: 17,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 18),
            Text.rich(prompt('ls ./stack')),
            Text(
              'flutter  react  typescript  python  c++  firebase',
              style: mono.copyWith(color: AppColors.string, fontSize: 15),
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                Text(
                  '\$ ',
                  style: mono.copyWith(color: AppColors.string, fontSize: 16),
                ),
                const _BlinkingCursor(),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => scrollToSection(aboutMeKey),
                  child: const Text('about me'),
                ),
                const SizedBox(width: 14),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.keyword.withOpacity(0.12),
                    side: const BorderSide(color: AppColors.keyword),
                  ),
                  onPressed: () {
                    launchUrl(
                      Uri.base.resolve('resume.pdf'),
                      webOnlyWindowName: '_blank',
                    );
                  },
                  child: const Text('resume'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BlinkingCursor extends StatefulWidget {
  const _BlinkingCursor();

  @override
  State<_BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<_BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(width: 10, height: 20, color: AppColors.keyword),
    );
  }
}
