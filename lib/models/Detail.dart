class GameDetail {
  final int id;
  final String name;
  final String backgroundImage;
  final String rating;
  final String released;
  final List<Genre> genres;
  final List<Platform> platforms;
  final String description;

  GameDetail({
    required this.id,
    required this.name,
    required this.backgroundImage,
    required this.rating,
    required this.released,
    required this.genres,
    required this.platforms,
    required this.description,
  });

  factory GameDetail.fromJson(Map<String, dynamic> json) {
    List<dynamic> genresJson = json['genres'];
    List<Genre> genres = genresJson.map((genre) => Genre.fromJson(genre)).toList();

    List<dynamic> platformsJson = json['platforms'];
    List<Platform> platforms = platformsJson.map((platform) => Platform.fromJson(platform)).toList();

    return GameDetail(
      id: json['id'],
      name: json['name'],
      backgroundImage: json['background_image'],
      rating: json['rating'].toString(),
      released: json['released'],
      genres: genres,
      platforms: platforms,
      description: json['description_raw'],
    );
  }
}

class Genre {
  final int id;
  final String name;
  final String slug;

  Genre({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}

class Platform {
  final int id;
  final String name;
  final String slug;

  Platform({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Platform.fromJson(Map<String, dynamic> json) {
    return Platform(
      id: json['platform']['id'],
      name: json['platform']['name'],
      slug: json['platform']['slug'],
    );
  }
}
// import 'package:equatable/equatable.dart';
//
// class GameDetails extends Equatable {
//   final int id;
//   final String name;
//   final String? description;
//   final String? backgroundImage;
//   final String? backgroundImageAdditional;
//   final String? website;
//   final int? creatorsCount;
//   final List<Developers>? developers;
//   final String? descriptionRaw;
//   final int? metacritic;
//   final String? released;
//   final List<Genres>? genres;
//   /* final List<GamePlatformsResults>? platforms;*/
//   /*final List<ShortScreenShots>? screenShots;*/
//
//   const GameDetails(
//       {required this.id,
//         required this.name,
//         this.description,
//         this.backgroundImage,
//         this.backgroundImageAdditional,
//         this.website,
//         this.creatorsCount,
//         this.developers,
//         this.metacritic,
//         this.released,
//         this.genres,
//         this.descriptionRaw,
//         /*this.platforms,*/
//         /*this.screenShots,*/
//       });
//
//   @override
//   List<Object?> get props => [
//     id,
//     name,
//     description,
//     backgroundImage,
//     backgroundImageAdditional,
//     website,
//     creatorsCount,
//     developers,
//     descriptionRaw,
//     metacritic,
//     released,
//     /* platforms*/
//     /*screenShots*/
//   ];
// }
//
// class Genres extends Equatable {
//   final int id;
//   final String name;
//
//   const Genres({ required this.id,  required this.name});
//
//   @override
//   List<Object?> get props => [id, name];
//
// }
//
//
// class Developers extends Equatable {
//   final int id;
//   final String name;
//   final int gamesCount;
//   final String imageBackground;
//
//   const Developers({required this.id, required this.name,required this.gamesCount, required this.imageBackground});
//
//   @override
//   List<Object?> get props => [id, name, gamesCount, imageBackground];
// }
//
// class ShortScreenShots extends Equatable {
//   final String image;
//   const ShortScreenShots({required this.image});
//
//   @override
//   List<Object?> get props => [image];
// }
