class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String imageLink;
  final String? githubUrl;
  final String? liveUrl;
  Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.imageLink,
    this.githubUrl,
    this.liveUrl,
  });
}
