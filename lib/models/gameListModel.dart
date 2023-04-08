class Game {
  final int id;
  final String name;
  final String released;
  final String backgroundImage;

  Game({
    required this.id,
    required this.name,
    required this.released,
    required this.backgroundImage,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] as int,
      name: json['name'] as String,
      released: json['released'] as String,
      backgroundImage: json['background_image'] as String,
    );
  }
}
