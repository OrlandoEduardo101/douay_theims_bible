import 'package:bible_avm_mobile/custom_app_bar.dart';
import 'package:bible_avm_mobile/modules/books/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../theme_provider.dart';

class CharptersPage extends StatefulWidget {
  const CharptersPage({
    Key? key,
    required this.bookEntity,
    required this.themeProvider,
  }) : super(key: key);
  final BookEntity bookEntity;
  final ThemeProvider themeProvider;

  @override
  State<CharptersPage> createState() => _CharptersPageState();
}

class _CharptersPageState extends State<CharptersPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        themeProvider: widget.themeProvider,
        title: widget.bookEntity.bookName,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
          ),
          itemCount: widget.bookEntity.charpters.length,
          itemBuilder: (context, index) {
            final item = widget.bookEntity.charpters[index];
            return InkWell(
              onTap: () {
                Modular.to.pushNamed('/verses', arguments: item);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(color: theme.colorScheme.onTertiary, borderRadius: BorderRadius.circular(20)),
                child: Text(
                  item.charpterNumber,
                  style: theme.textTheme.titleLarge?.copyWith(fontSize: 32),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
