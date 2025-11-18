import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_website/core/models/awards_model.dart';
import 'package:portfolio_website/presentation/widgets/shared/footer.dart';

class AwardsSection extends StatelessWidget {
  AwardsSection({super.key});

  final List<Award> awards = [
    Award(
      name: 'CaYPT (Canadian Young Physics Tournament)',
      year: '2025',
      description: 'Silver Medalist in Canada',
    ),
    Award(name: 'AP Physics 1', year: '2025', description: 'Score of 5'),
    Award(name: 'AP Chemistry', year: '2025', description: 'Score of 5'),
    Award(name: 'AP Computer Science', year: '2025', description: 'Score of 5'),
    Award(name: 'OAPT Physics Contest', year: '2025', description: 'Top 10%'),

    Award(
      name: 'CEMC Galois Contest',
      year: '2025',
      description: 'Distinction (Top 25%)',
    ),
    Award(
      name: 'CEMC Fermat Contest',
      year: '2025',
      description: 'Distinction (Top 25%)',
    ),
    Award(
      name: 'Canadian Intermediate Mathematics Contest (CIMC)',
      year: '2024',
      description: 'Honor Roll (< Top 2%)',
    ),
    Award(
      name: 'Canadian Computing Contest Junior',
      year: '2024',
      description: 'Distinction (Top 25%)',
    ),
    Award(
      name: 'CEMC Fryer Contest',
      year: '2023',
      description: 'Distinction (Top 25%)',
    ),
    Award(
      name: 'CEMC Cayley Contest',
      year: '2023',
      description: 'Distinction (Top 25%)',
    ),
    Award(
      name: 'Canadian Intermediate Mathematics Contest (CIMC)',
      year: '2023',
      description: 'Distinction (Top 25%)',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  "Awards & Achievements",
                  style: textTheme.displayLarge?.copyWith(fontSize: 48),
                ),
                const SizedBox(height: 20),
                Text(
                  "A collection of my competitive and professional achievements.",
                  style: textTheme.headlineSmall?.copyWith(
                    color: const Color(0xFFFFD700), // Gold
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 15.0),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 2.5,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildAwardCard(awards[index], context),
              childCount: awards.length,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Footer(),
          ),
        ),
      ],
    );
  }

  Widget _buildAwardCard(Award award, BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.white.withOpacity(0.1)),
      ),
      margin: const EdgeInsets.only(bottom: 15),
      clipBehavior: Clip.antiAlias,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: Colors.white.withOpacity(0.05),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.emoji_events_outlined,
                      color: const Color(0xFFFFD700),
                      size: 28,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            award.name,
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge?.copyWith(fontSize: 18),
                          ),
                          if (award.description != null) ...[
                            const SizedBox(height: 6),
                            Text(
                              award.description!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 12,
                right: 16,
                child: Text(
                  award.year,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
