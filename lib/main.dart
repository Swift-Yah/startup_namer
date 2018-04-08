import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(new StartupNamer());

class StartupNamer extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            title: 'Welcome to Flutter',
            home: new Scaffold(
                appBar: new AppBar(
                    title: new Text('Welcome to Flutter'),
                ),
                body: new Center(
                    child: new RandomWords(),
                ),
            ),
        );
    }
}

class RandomWords extends StatefulWidget {
    @override
    createState() => new RandomStateWords();
}

class RandomStateWords extends State<RandomWords> {
    @override
    Widget build(BuildContext context) {
        final wordPair = new WordPair.random();

        return new Text(wordPair.asPascalCase);
    }
}
