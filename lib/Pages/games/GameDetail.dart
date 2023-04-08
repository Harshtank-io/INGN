import 'package:flutter/material.dart';
import 'package:ingn/models/Detail.dart';

class GameDetailPage extends StatelessWidget {
  final GameDetail gameDetail;

  const GameDetailPage({required this.gameDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gameDetail.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(gameDetail.backgroundImage),
            ),
            SizedBox(height: 16.0),
            Text(
              gameDetail.name,
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 8.0),
            Text(
              gameDetail.released,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 16.0),
            Text(
              gameDetail.description,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 8.0),
                Text(gameDetail.rating.toString()),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('Play Now'),
            ),
          ],
        ),
      ),
    );
  }
}
