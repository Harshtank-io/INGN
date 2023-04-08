import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ingn/models/gameListModel.dart';


class GameService {
  static const String _apiKey = '6e69a5907aa8465d9cbe345804c47af1';
  static const String _baseUrl = 'https://api.rawg.io/api';
  final int page = 20;

  static Future<List<Game>> getAllGames(int page) async {
    final response = await http.get(Uri.parse('$_baseUrl/games?&page_size=200&key=$_apiKey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> gamesData = data['results'];
      final List<Game> games = gamesData.map((gameData) => Game.fromJson(gameData)).toList();
      return games;
    } else {
      throw Exception('Failed to load games');
    }
  }

}
