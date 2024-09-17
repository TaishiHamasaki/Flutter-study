import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/anime_provider.dart';
import '../models/anime.dart';

class AddAnimeScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Anime')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: genreController,
              decoration: InputDecoration(labelText: 'Genre'),
            ),
            TextField(
              controller: ratingController,
              decoration: InputDecoration(labelText: 'Rating (0-10)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text;
                final genre = genreController.text;
                final rating = double.tryParse(ratingController.text) ?? 0.0;
                final description = descriptionController.text;

                if (title.isNotEmpty && genre.isNotEmpty && description.isNotEmpty) {
                  final anime = Anime(
                      title: title,
                      genre: genre,
                      rating: rating,
                    description: description,
                  );
                  Provider.of<AnimeProvider>(context, listen: false).addAnime(anime, description);
                  Navigator.pop(context);
                }
              },
              child: Text('Add Anime'),
            ),
          ],
        ),
      ),
    );
  }
}
