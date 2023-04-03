import 'package:flutter/material.dart';
import 'package:ingn/models/gameListModel.dart';

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    game.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    game.released ?? '',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            if (game.backgroundImage != null)
              SizedBox(
                width: 200.0,
                height: 100.0,
                child: Image.network(
                  game.backgroundImage!,
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
