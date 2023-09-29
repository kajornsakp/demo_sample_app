import 'package:demo_flutter_app/components/big_word_card.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomPage extends StatelessWidget {
  const RandomPage(
      {super.key,
      required this.word,
      required this.onGenerateWordClicked,
      required this.onFavoriteClicked,
      required this.isFavorite});

  final WordPair word;
  final VoidCallback onGenerateWordClicked;
  final VoidCallback onFavoriteClicked;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigWordCard(word: word.asPascalCase),
          const SizedBox(
            height: 32,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: onFavoriteClicked,
                child: isFavorite ? Text("Remove") : Text("Favorite")),
            const SizedBox(
              width: 32,
            ),
            ElevatedButton(
                onPressed: onGenerateWordClicked,
                child: const Text("Randomize")),
          ]),
        ],
      ),
    );
  }
}
