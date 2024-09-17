import 'package:flutter/material.dart';
import '../models/anime.dart';

class AnimeTile extends StatelessWidget {
  final Anime anime;
  final int index;

  AnimeTile({required this.anime, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(anime.title),
      subtitle: Text(anime.description),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          // 削除ボタンの処理をここに追加
        },
      ),
    );
  }
}