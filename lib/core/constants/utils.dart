import 'package:flutter/material.dart';

import 'package:portfolio_website/core/models/star_model.dart';

import 'package:portfolio_website/core/constants/globals.dart' as globals;

void initializeStars(Size bounds) {
  if (globals.starsList.isEmpty && bounds.width > 0 && bounds.height > 0) {
    for (int i = 0; i < globals.numberOfStars; i++) {
      globals.starsList.add(Star()..randomize(bounds));
    }
    globals.isInitialized = true;
  }
}

void scrollToSection(GlobalKey key) {
  final context = key.currentContext;
  if (context != null) {
    globals.scrollStarPusher = 5;
    Scrollable.ensureVisible(
      context,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOutCirc,
    );
  } else {
    print('not built yet??');
  }
}
