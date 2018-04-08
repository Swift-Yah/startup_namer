import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(new StartupNamer());

class StartupNamer extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            title: 'Startup Name Generator',
            home: new RandomWords());
    }
}

class RandomWords extends StatefulWidget {
    @override
    createState() => new RandomStateWords();
}

class RandomStateWords extends State<RandomWords> {
    final _suggestions = <WordPair>[];
    final _biggerFont = const TextStyle(fontSize: 18.0);

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text('Startup Name Generator'),
            ),
            body: _buildSuggestions(),
        );
    }

    Widget _buildSuggestions() {
        return new ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, row) {
                if (row.isOdd) return new Divider();

                final index = row ~/ 2;

                if (index >= _suggestions.length) {
                    _suggestions.addAll(generateWordPairs().take(10));
                }

                return _buildRow(_suggestions[index]);
            },
        );
    }

    Widget _buildRow(WordPair pair) {
        return new ListTile(
            title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
            ),
        );
    }
}
