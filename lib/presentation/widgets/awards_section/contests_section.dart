import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_website/core/models/awards_model.dart';

class AwardsSection {
  List<Widget> buildSlivers({
    required BuildContext context,
    required String currentSortOption,
    required List<Award> awards,
    required ValueChanged<String?> onSortChanged,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final awardsGlowColor = const Color(0xFFFFD700);

    return [
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
                  color: awardsGlowColor,
                ),
              ),
              const SizedBox(height: 60),
              Align(
                alignment: Alignment.topRight,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: currentSortOption,
                    items: <String>['Relevance', 'Date']
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                        .toList(),
                    onChanged: onSortChanged,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 15.0,
          top: 20.0,
        ),
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
    ];
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
                    const Icon(
                      Icons.emoji_events_outlined,
                      color: Color.fromARGB(255, 248, 211, 1),
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
