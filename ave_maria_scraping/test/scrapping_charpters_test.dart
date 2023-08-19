import 'package:ave_maria_scraping/scrapping_charpters.dart';
import 'package:test/test.dart';

Future<void> main() async {
  test('must return a map with books charpters', () async {
    final charpters = await scrapeChaptersList('https://www.bibliacatolica.com.br/biblia-ave-maria/genesis/1/');
    expect(charpters.keys.first, equals('1'));
  });
}
