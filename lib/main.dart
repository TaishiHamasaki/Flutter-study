import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anime_list_app/providers/anime_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AnimeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime List',
      home: AnimeListScreen(),
    );
  }
}

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
          return ListTile(
            title: Text(anime.title),
            subtitle: Text('${anime.genre} - Rating: ${anime.rating}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                animeProvider.removeAnime(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // アニメ追加画面への遷移を実装
        },
        child: Icon(Icons.add),
      ),
    );
  }
}