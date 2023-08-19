import 'dart:developer';

import 'package:html/parser.dart' as html_parser;
import 'package:uno/uno.dart';

Future<Map<String, dynamic>> scrapeVersesList(String bookUrl) async {
  final uno = Uno();
  final response = await uno.get(bookUrl,
      responseType: ResponseType.plain,
      headers: {'Content-type': 'text/html; charset=utf-8', 'Accept': 'text/html; charset=utf-8'});

  final versesMap = <String, dynamic>{};

  if (response.status == 200) {
    final document = html_parser.parse(response.data);

    final article = document.querySelector('article.bibleChapter');
    final entrySection = article?.querySelector('section.entry');

    final verses = entrySection?.querySelectorAll('p');

    for (final verse in verses ?? []) {
      final verseSplit = verse?.text.toString().split('. ');
      String verseNumber = verseSplit?.first ?? '';
      String verseText = verseSplit?.last ?? '';
      log('$verseNumber: $verseText');
      versesMap.addAll({verseNumber: verseText});
    }

    return versesMap;
  } else {
    log('Falha ao carregar a página');
    throw Exception('Falha ao carregar a página');
  }
}
