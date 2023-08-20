import 'package:flutter/material.dart';

import '../../custom_app_bar.dart';
import '../../theme_provider.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key, this.title = 'Livros', required this.themeProvider}) : super(key: key);
  final ThemeProvider themeProvider;

  final String title;

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  ThemeProvider get themeProvider => widget.themeProvider;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        themeProvider: themeProvider,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
