import 'package:flutter/material.dart';

import 'package:portfolio_website/presentation/widgets/shared/star_model.dart';

import 'package:portfolio_website/core/constants/globals.dart' as globals;

void initializeStars(Size bounds) {
  if (globals.starsList.isEmpty && bounds.width > 0 && bounds.height > 0) {
    for (int i = 0; i < globals.numberOfStars; i++) {
      globals.starsList.add(Star()..randomize(bounds));
    }
    globals.isInitialized = true;
  }
}
