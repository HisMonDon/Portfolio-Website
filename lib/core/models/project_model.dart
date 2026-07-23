//I'm gonna reuse this for achievements section as well.
class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final List<String> imageLinks;
  final String? githubUrl;
  final String? liveUrl;
  Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.imageLinks,
    this.githubUrl,
    this.liveUrl,
  });
}
