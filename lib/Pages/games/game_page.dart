import 'package:carousel_slider/carousel_slider.dart';
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
            return Column(
              children: [
                SizedBox(
                  height: 200,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                    ),
                    items: games.map((game) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Image.network(
                                  game.backgroundImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(game.name),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(game.rating.toString()),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
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
                            subtitle: Text(game.rating.toString()),
                          ),
                          child: Image.network(game.backgroundImage, fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                ),
              ],
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
