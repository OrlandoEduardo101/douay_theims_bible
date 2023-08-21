import 'package:bible_avm_mobile/app_controller.dart';
import 'package:bible_avm_mobile/modules/books/books_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../custom_app_bar.dart';
import '../../theme_provider.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({
    Key? key,
    required this.themeProvider,
    required this.appController,
    required this.booksController,
    this.title = 'Livros',
  }) : super(key: key);
  final ThemeProvider themeProvider;
  final AppController appController;
  final BooksController booksController;

  final String title;

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  ThemeProvider get themeProvider => widget.themeProvider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        themeProvider: themeProvider,
        title: widget.title,
      ),
      body: Center(
        child: ListView(
          children: [
            ValueListenableBuilder(
                valueListenable: widget.appController,
                builder: (context, state, child) {
                  if (state.testaments.isEmpty) {
                    return InkWell(
                      onTap: () {
                        Modular.to.pushNamedAndRemoveUntil('/', (p0) => false);
                      },
                      child: Container(
                        color: Colors.blue,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(8),
                        child: const Text('Baixar livros'),
                      ),
                    );
                  }
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = state.testaments[index];
                      return Column(
                        children: [
                          Text(
                            item.testamentName,
                            style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onBackground),
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: item.books.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Modular.to.pushNamed('/charpters', arguments: item.books[index]);
                                      },
                                      child: Text(
                                        item.books[index].bookName,
                                        style: theme.textTheme.titleMedium,
                                      ),
                                    ),
                                  )),
                        ],
                      );
                    },
                    itemCount: state.testaments.length,
                  );
                }),
            InkWell(
              onTap: () {
                widget.booksController.clearAll();
              },
              child: Container(
                color: Colors.red,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                child: const Text('Apagar o banco de dados local'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
