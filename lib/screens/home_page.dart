import 'package:demo_flutter_app/screens/favorite_page.dart';
import 'package:demo_flutter_app/screens/random_page.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WordPair word = generateWordPairs().first;
  int _currentIndex = 0;
  List<WordPair> favoriteWords = [];

  void generateWord() {
    var wordPair = generateWordPairs().first;
    setState(() {
      word = wordPair;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (_currentIndex) {
      case 0:
        page = RandomPage(
            word: word,
            onGenerateWordClicked: generateWord,
            onFavoriteClicked: () {
              setState(() {
                favoriteWords.contains(word)
                    ? favoriteWords.remove(word)
                    : favoriteWords.add(word);
              });
            },
            isFavorite: favoriteWords.contains(word));
        break;
      case 1:
        page = FavoritePage(favoriteWords: favoriteWords);
        break;
      default:
        page = Container();
        break;
    }

    return Scaffold(
      body: Row(
        children: [
          Visibility(
            visible: MediaQuery.of(context).size.width > 600,
            child: NavigationRail(
                destinations: [
                  NavigationRailDestination(
                      icon: Icon(Icons.home), label: Text("Home")),
                  NavigationRailDestination(
                      icon: Icon(Icons.favorite), label: Text("Favorite")),
                ],
                selectedIndex: _currentIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                }),
          ),
          Expanded(
            child: page,
          ),
        ],
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width > 600
          ? null
          : BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Home", tooltip: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: "Favorite",
                    tooltip: "Favorite")
              ],
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
