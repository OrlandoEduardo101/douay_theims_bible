import 'dart:developer';

import 'package:html/parser.dart' as html_parser;
import 'package:uno/uno.dart';

Future<Map<String, dynamic>> scrapeBooksList() async {
  final uno = Uno(baseURL: 'https://www.bibliacatolica.com.br');
  final response = await uno.get('/biblia-ave-maria',
      responseType: ResponseType.plain,
      headers: {'Content-type': 'text/html; charset=utf-8', 'Accept': 'text/html; charset=utf-8'});

  final bookMap = <String, dynamic>{};

  if (response.status == 200) {
    final document = html_parser.parse(response.data);

    final rows = document.querySelectorAll('.row.booksList');

    for (var row in rows) {
      final bookTestamentList = [];
      final pageHeader = row.parent?.querySelector('.page-header');
      final headerText = pageHeader?.text.trim() ?? 'No header text';

      final books = row.querySelectorAll('li');

      log('Header: $headerText');
      for (var book in books) {
        final bookLink = book.querySelector('a');
        final bookName = bookLink?.text ?? 'No name';
        final bookUrl = bookLink?.attributes['href'] ?? 'No URL';

        bookTestamentList.add({
          'bookName': bookName,
          'bookUrl': bookUrl,
        });

        log('Book: $bookName');
        log('URL: $bookUrl');
      }

      bookMap.addAll({
        headerText: bookTestamentList,
      });

      log('---');
    }

    return bookMap;
  } else {
    log('Falha ao carregar a página');
    throw Exception('Falha ao carregar a página');
  }
}
