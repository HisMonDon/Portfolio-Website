/// A single attribution entry on the credits page, e.g. a font, package,
/// or asset — with an optional link to its source.
class CreditItem {
  final String name;
  final String detail;
  final String? url;
  final String linkLabel;

  const CreditItem({
    required this.name,
    required this.detail,
    this.url,
    this.linkLabel = 'open',
  });
}

/// A named group of [CreditItem]s, e.g. "fonts" or "open source packages".
class CreditGroup {
  final String title;
  final List<CreditItem> items;

  const CreditGroup({required this.title, required this.items});
}
