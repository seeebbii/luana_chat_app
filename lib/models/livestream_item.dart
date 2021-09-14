class LivestreamItem {
  final String? id;
  final String? name;
  final String? location;
  final String? title;
  final String? imageUrl;
  final String? viewers;
  final bool? active;

  LivestreamItem(
      {this.id,
      this.name,
      this.location,
      this.title,
      this.imageUrl,
      this.viewers,
      this.active});
}
