import 'package:ave_maria_scraping/scrapping_verses.dart';
import 'package:test/test.dart';

Future<void> main() async {
  test('must return a map with books charpters', () async {
    final verses = await scrapeVersesList('https://www.bibliacatolica.com.br/biblia-ave-maria/genesis/1/');
    expect(verses.keys.first, equals('1'));
  });
}
