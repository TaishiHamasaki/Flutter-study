import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/anime_provider.dart';
import 'add_anime_screen.dart';
import '../widgets/anime_title.dart';

class AnimeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final animeProvider = Provider.of<AnimeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Anime List')),
      body: ListView.builder(
        itemCount: animeProvider.animeList.length,
        itemBuilder: (context, index) {
          final anime = animeProvider.animeList[index];
          return AnimeTile(anime: anime, index: index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddAnimeScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}