class Favorites {
  final String id;
  final String imageUrl;
  final String caption;
  bool isFavorite;

  Favorites({required this.id, required this.imageUrl, required this.caption, this.isFavorite = false});

  factory Favorites.fromJson(Map<String, dynamic> json) {
    return Favorites(
      id: json['id'],
      imageUrl: json['imageUrl'],
      caption: json['caption'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'caption': caption,
      'isFavorite': isFavorite,
    };
  }
}