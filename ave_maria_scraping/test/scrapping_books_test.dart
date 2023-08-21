import 'package:ave_maria_scraping/scrapping_books.dart';
import 'package:test/test.dart';

Future<void> main() async {
  test('must return a map with books names', () async {
    final books = await scrapeBooksList();
    expect(books.values.first[0]['bookName'], equals("Gênesis"));
  });
}

