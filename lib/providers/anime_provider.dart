import 'package:flutter/material.dart';
import 'package:anime_list_app/models/anime.dart';

class AnimeProvider with ChangeNotifier {
  List<Anime> _animeList = [];

  List<Anime> get animeList => _animeList;

  void addAnime(Anime anime, String description) {
    _animeList.add(anime);
    notifyListeners();
  }

  void removeAnime(int index) {
    _animeList.removeAt(index);
    notifyListeners();
  }
}