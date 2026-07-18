class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final List<String> imageLinks;
  final String? githubUrl;
  final String? liveUrl;

  /// Longer, case-study-style write-up shown on the project's detail page.
  final String? overview;

  /// Short bullet points shown alongside [overview] on the detail page.
  final List<String> highlights;

  Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.imageLinks,
    this.githubUrl,
    this.liveUrl,
    this.overview,
    this.highlights = const [],
  });

  /// Whether this project has enough content to warrant its own detail page.
  bool get hasDetailPage => overview != null;
}
