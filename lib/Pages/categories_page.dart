import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingn/Pages/page1.dart';
import 'package:ingn/models/gameListModel.dart';


class CategoriesPage extends StatelessWidget {
  CategoriesPage({Key? key}) : super(key: key);
  BuildContext? blocContext;

  final List<Game> games =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers: [
           // SliverPersistentHeader(
           //   pinned: true,
           // ),
            SliverList(
                delegate: SliverChildListDelegate([
                  buildBody(context),
                ])
            )
          ]
      ),
    );
  }


  Widget buildBody(BuildContext context)
  {
    return GameList();
  }


}


