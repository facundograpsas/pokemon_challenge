class Pokemon {
  Pokemon({required this.name, required this.url, this.imageUrl});

  final String? name;
  final String? url;
  String? imageUrl;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };

  @override
  String toString() {
    return '$name, $url, ';
  }
}
