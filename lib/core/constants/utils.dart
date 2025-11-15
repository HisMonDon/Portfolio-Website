import 'package:flutter/material.dart';

import 'package:portfolio_website/core/constants/globals.dart' as globals;

void _initializeStars(Size bounds) {
  if (globals.starsList.isEmpty && bounds.width > 0 && bounds.height > 0) {
    for (int i = 0; i < _numberOfStars; i++) {
      globals.starsList.add(Star()..randomize(bounds));
    }
    _isInitialized = true;
  }
}
