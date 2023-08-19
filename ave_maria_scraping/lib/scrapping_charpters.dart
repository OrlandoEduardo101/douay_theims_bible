import 'dart:developer';

import 'package:html/parser.dart' as htmlParser;
import 'package:uno/uno.dart';

Future<Map<String, dynamic>> scrapeChaptersList(String bookUrl) async {
  final uno = Uno();
  final response = await uno.get(bookUrl,
      responseType: ResponseType.plain,
      headers: {'Content-type': 'text/html; charset=utf-8', 'Accept': 'text/html; charset=utf-8'});

  final chapterMap = <String, dynamic>{};

  if (response.status == 200) {
    final document = htmlParser.parse(response.data);

    final itemDiv = document.querySelector('div.item.clearfix');
    final list = itemDiv?.querySelector('ul.listChapter');

    final chapters = list?.querySelectorAll('li');

    for (final chapter in chapters ?? []) {
      String link = chapter.querySelector('a').attributes['href'];
      String title = chapter.querySelector('a').attributes['title'];
      String chapterNumber = title.split(', ')[1];

      log("Capítulo $chapterNumber: $link");
      chapterMap.addAll({chapterNumber: link});
    }

    return chapterMap;
  } else {
    log('Falha ao carregar a página');
    throw Exception('Falha ao carregar a página');
  }
}
