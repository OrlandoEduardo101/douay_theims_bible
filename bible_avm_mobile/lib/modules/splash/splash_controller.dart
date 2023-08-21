import 'dart:async';

import 'package:bible_avm_mobile/app_controller.dart';
import 'package:bible_avm_mobile/modules/books/book_entity.dart';
import 'package:bible_avm_mobile/modules/testament/testament_entity.dart';
import 'package:bible_avm_mobile/modules/verses/verse_entity.dart';
import 'package:database/exports.dart';

import '../charpters/charpters_entity.dart';
import '../services/database/i_local_databse_service.dart';
import '../services/scraping_service.dart';

class SplashController {
  final ILocalDatabaseService localDatabaseService;
  final IScrapingService scrapingService;
  final AppController appController;

  SplashController({
    required this.localDatabaseService,
    required this.scrapingService,
    required this.appController,
  });

  Stream<String> initBooks() async* {
    yield 'Buscando livros...';
    await localDatabaseService.initalizeDatabase();
    var localTestaments = await localDatabaseService.instance.testamentDao.getAllTestaments();

    if (localTestaments.length < 2) {
      yield 'Baixando capítulos...';
      final stream = donwloadBooks();

      await for (final event in stream) {
        yield event;
        if (event == 'Download terminado') {}
      }

      localTestaments = await localDatabaseService.instance.testamentDao.getAllTestaments();
    }

    yield 'Carregando versos...';
    final testaments = await readLocalBooks(localTestaments);

    appController.updateState(appController.value.copyWith(testaments: testaments));
    yield 'Tudo pronto';
  }

  Future<List<TestamentEntity>> readLocalBooks(List<TestamentModel> localTestaments) async {
    final List<TestamentEntity> testaments = [];
    for (final localTestament in localTestaments) {
      final localBooks = await localDatabaseService.instance.bookDao.getByTestamentId(localTestament.id ?? -1);
      final List<BookEntity> books = [];

      for (final localBook in localBooks) {
        final localCharpters = await localDatabaseService.instance.charpterDao.getBybookId(localBook.id ?? -1);
        final List<CharptersEntity> charpters = [];
        final bookName = localBook.bookName;

        for (final localCharpter in localCharpters) {
          final localVerses = await localDatabaseService.instance.verseDao.getBycharpterId(localCharpter.id ?? -1);
          List<VerseEntity> verses = [];
          for (final localVerse in localVerses) {
            verses.add(VerseEntity(
              id: localVerse.id ?? -1,
              charpterId: localVerse.charpterId,
              bookId: localVerse.bookId,
              testamentId: localVerse.testamentId,
              verseNumber: localVerse.verseNumber,
              verseText: localVerse.verseText,
            ));
          }

          charpters.add(CharptersEntity(
            id: localCharpter.id ?? -1,
            testamentId: localCharpter.testamentId,
            bookId: localCharpter.bookId,
            charpterNumber: localCharpter.charpterNumber,
            charpterUrl: localCharpter.charpterUrl,
            verses: verses,
            bookName: bookName,
          ));
        }

        books.add(BookEntity(
          bookName: localBook.bookName,
          bookUrl: localBook.bookUrl,
          id: localBook.id ?? -1,
          testamentId: localBook.testamentId,
          charpters: charpters,
        ));
      }
      testaments
          .add(TestamentEntity(id: localTestament.id ?? -1, testamentName: localTestament.testamentName, books: books));
    }
    return testaments;
  }

  Stream<String> donwloadBooks() async* {
    final remoteBooks = await scrapingService.getBooks();

    for (final testamentItem in remoteBooks.keys) {
      final testamentId = await localDatabaseService.instance.testamentDao
          .insertTestament(TestamentModel(testamentName: testamentItem));

      for (final book in remoteBooks[testamentItem]) {
        final bookId = await localDatabaseService.instance.bookDao
            .insertBook(BookModel(bookName: book['bookName'], bookUrl: book['bookUrl'], testamentId: testamentId));

        final remoteChapters = await scrapingService.getCharpter(book['bookUrl']);

        for (final chapterItem in remoteChapters.keys) {
          final charpterNum = chapterItem;
          final charpterId = await localDatabaseService.instance.charpterDao.insertCharpter(CharpterModel(
            charpterNumber: chapterItem,
            charpterUrl: remoteChapters[chapterItem],
            testamentId: testamentId,
            bookId: bookId,
          ));

          final remoteVerses = await scrapingService.getVerses(remoteChapters[chapterItem]);

          for (final verseItem in remoteVerses.keys) {
            yield 'Baixando ${book['bookName']} $charpterNum: $verseItem';
            await localDatabaseService.instance.verseDao.insertVerse(VerseModel(
              verseNumber: verseItem,
              charpterId: charpterId,
              testamentId: testamentId,
              verseText: remoteVerses[verseItem],
              bookId: bookId,
            ));
          }
        }
      }
    }
    yield 'Download terminado';
    return;
  }
}
