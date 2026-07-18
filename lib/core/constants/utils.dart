import 'package:flutter/material.dart';
import 'package:portfolio_website/core/models/project_model.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';

void scrollToSection(GlobalKey key) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOutCirc,
    );
  }
}

/// Derives a `slug.ext`-style "filename" for a project, based on its
/// primary technology, for use in editor-tab and file-listing chrome.
String projectFileName(Project project) {
  final slug = project.title
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9\s]'), '')
      .trim()
      .replaceAll(RegExp(r'\s+'), '-');
  final techs = project.technologies.map((t) => t.toLowerCase());
  String ext = '.md';
  if (techs.any((t) => t.contains('flutter') || t.contains('dart'))) {
    ext = '.dart';
  } else if (techs.any(
    (t) => t.contains('react') || t.contains('javascript'),
  )) {
    ext = '.tsx';
  } else if (techs.any((t) => t == 'python')) {
    ext = '.py';
  } else if (techs.any((t) => t == 'c++')) {
    ext = '.cpp';
  } else if (techs.any((t) => t == 'java')) {
    ext = '.java';
  }
  return '$slug$ext';
}

/// A stable accent color per project, derived from its primary technology,
/// used as the little "language dot" in the project file listing.
Color projectAccentColor(Project project) {
  final techs = project.technologies.map((t) => t.toLowerCase());
  if (techs.any((t) => t.contains('flutter') || t.contains('dart'))) {
    return AppColors.string;
  } else if (techs.any(
    (t) => t.contains('react') || t.contains('javascript'),
  )) {
    return AppColors.keyword;
  } else if (techs.any((t) => t == 'python')) {
    return const Color(0xFF6FA8DC);
  } else if (techs.any((t) => t == 'c++')) {
    return const Color(0xFFE47272);
  } else if (techs.any((t) => t == 'java')) {
    return const Color(0xFFE0A96D);
  }
  return AppColors.fog;
}
