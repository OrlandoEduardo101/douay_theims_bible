import 'package:ave_maria_scraping/ave_maria_scraping.dart' as scrap;

abstract class IScrapingService {
  Future<Map> getBooks();
  Future<Map> getCharpter(String url);
  Future<Map> getVerses(String url);
}

class ScrapingService implements IScrapingService {
  @override
  Future<Map> getBooks() async {
    final map = await scrap.scrapeBooksList();
    return map;
  }

  @override
  Future<Map> getCharpter(String url) async {
    final map = await scrap.scrapeChaptersList(url);
    return map;
  }

  @override
  Future<Map> getVerses(String url) async {
    final map = await scrap.scrapeVersesList(url);
    return map;
  }
}
