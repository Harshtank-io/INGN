
import 'package:flutter/material.dart';
import 'package:ingn/models/gameListModel.dart';
import 'package:ingn/servies/game_service.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  final List<Game> games = [];
  int currentPage =1;
  late Future<List<Game>> gameFuture;

  @override
  void initState() {
    super.initState();
    fetchGames();
  }

  void fetchGames() {
    gameFuture = GameService.getAllGames(currentPage);
    gameFuture.then((fetchedGames) {
      setState(() {
        games.addAll(fetchedGames);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Game>>(
      future: gameFuture,
      builder: (context,snapshot) {
        if(snapshot.hasData) {
          return GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: games.length,
            itemBuilder: (BuildContext context, int index) {
              var game = games[index];
              return GestureDetector(
                onTap: () {},
                child: GridTile(
                  footer: GridTileBar(
                    backgroundColor: Colors.black54,
                    title: Text(game.name),
                    subtitle: Text(game.released),
                  ),
                  child: Image.network(game.backgroundImage, fit: BoxFit.cover),
                ),
              );
            },
          );
        }else if(snapshot.hasError){
          return const Center(
            child: Text("Error",style: TextStyle(color: Colors.red),),
          );
        }else {
          return const Center(
            child:CircularProgressIndicator(),
          );
        }
      }
    );
  }
}
