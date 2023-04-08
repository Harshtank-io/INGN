import 'package:flutter/material.dart';
import 'package:ingn/Pages/gameCard.dart';
import 'package:ingn/models/gameListModel.dart';
import 'package:ingn/servies/game_service.dart';

class GameList extends StatefulWidget {
  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  final ScrollController _scrollController = ScrollController();
  late Future<List<Game>> _gamesFuture;
  int _currentPage = 1;
  final List<Game> game =[];

  @override
  void initState() {
    super.initState();
    _loadGames();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadMoreGames();
    }
  }

  void _loadGames() {
    _gamesFuture = GameService.getAllGames(_currentPage);
  }

  Future<void> _loadMoreGames() async {
    setState(() {
      _currentPage++;
    });
    final List<Game> newGames = await GameService.getAllGames(_currentPage);
    setState(() {
      _gamesFuture = Future(() => _gamesFuture.then((games) => games + newGames));
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Game>>(
      future: _gamesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final games = snapshot.data!;
          return ListView.builder(
              // scrollDirection: Axis.horizontal,
            controller: _scrollController,
            itemCount: games.length + 1,
            itemBuilder: (context, index) {
              if (index == games.length) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final res = games[index];
                return GameCard(game: res);
              }
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading games'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
