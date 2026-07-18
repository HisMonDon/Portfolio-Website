import 'package:flutter/material.dart';
import 'package:portfolio_website/core/models/credit_model.dart';
import 'package:portfolio_website/presentation/widgets/credits_section/credit_card.dart';
import 'package:portfolio_website/presentation/widgets/shared/aesthetics/window_frame.dart';
import 'package:portfolio_website/presentation/widgets/shared/footer.dart';

class CreditsSection extends StatelessWidget {
  CreditsSection({super.key});

  final List<CreditGroup> groups = [
    CreditGroup(
      title: '3d & visual assets',
      items: [
        CreditItem(
          name: 'android_model.glb',
          detail:
              'Custom-rigged 3D android model rendered on the home page '
              'with model_viewer_plus. Original model obtained from Sketchfab.',
          url:
              "https://sketchfab.com/3d-models/connor-rk900-detroit-become-human-623e3f52b7da4116a4576f38479eaaaf",
        ),
      ],
    ),

    CreditGroup(
      title: 'Inspiration',
      items: [
        CreditItem(
          name: 'Detroit: Become Human',
          detail:
              "The editor/terminal aesthetic and android motif draw "
              "inspiration from Quantic Dream's game.",
          linkLabel: "https://www.quanticdream.com/en/detroit-become-human",
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        const horizontalPadding = 16.0;
        const gridSpacing = 16.0;
        final crossAxisCount = constraints.maxWidth < 800 ? 1 : 2;
        final available = constraints.maxWidth - horizontalPadding * 2;
        final cardWidth = crossAxisCount == 1
            ? available
            : (available - gridSpacing) / 2;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 36),
                  const CommentEyebrow(text: 'credits'),
                  const SizedBox(height: 12),
                  Text(
                    "Credits & Attributions",
                    style: textTheme.displayLarge?.copyWith(fontSize: 44),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "The resources I used building my portfolio website.",
                    style: textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
            for (final group in groups)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.title,
                      style: textTheme.titleLarge?.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: gridSpacing,
                      runSpacing: gridSpacing,
                      children: [
                        for (final item in group.items)
                          SizedBox(
                            width: cardWidth,
                            child: CreditCard(item: item),
                          ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
            ),
          ],
        );
      },
    );
  }
}
