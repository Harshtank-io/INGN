
class Game {
  final int id;
  final String name;
  final String released;
  final String backgroundImage;


  Game( {
    required this.id,
    required this.name,
    required this.released,
    required this.backgroundImage,

  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      name: json['name'],
      released: json['released'],

      backgroundImage: json['background_image'],
    );
  }
}