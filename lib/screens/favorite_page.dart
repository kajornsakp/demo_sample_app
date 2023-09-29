import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key, required this.favoriteWords});

  final List<WordPair> favoriteWords;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: favoriteWords
          .map((e) => ListTile(
                title: Text(e.asLowerCase),
              ))
          .toList(),
    );
  }
}
