library database;

import 'dart:async';

import 'package:database/src/daos/book_dao.dart';
import 'package:database/src/daos/charpter_dao.dart';
import 'package:database/src/daos/verse_dao.dart';
import 'package:database/src/models/book_model.dart';
import 'package:database/src/models/charpter_model.dart';
import 'package:database/src/models/verse_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'src/daos/testament_dao.dart';
import 'src/models/testament_model.dart';

export 'exports.dart';

part 'database.g.dart';

@Database(version: 1, entities: [TestamentModel, CharpterModel, BookModel, VerseModel])
abstract class AppDatabase extends FloorDatabase {
  TestamentDao get testamentDao;
  BookDao get bookDao;
  CharpterDao get charpterDao;
  VerseDao get verseDao;
}

// class MigrationFrom2To3 implements Migration {
//   MigrationFrom2To3();

//   @override
//   int get endVersion => 3;

//   @override
//   int get startVersion => 2;

//   @override
//   Future<void> migrate(Database database) async {
//     await database.transaction((transaction) async {
//       await transaction.execute('DROP TABLE IF EXISTS notifications');
//       await transaction.execute(
//         'CREATE TABLE IF NOT EXISTS `notifications` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `messageId` TEXT NOT NULL, `contentID` TEXT NOT NULL, `body` TEXT NOT NULL, `title` TEXT NOT NULL, `dateTime` TEXT NOT NULL, `link` TEXT NOT NULL, `status` INTEGER NOT NULL)',
//       );
//     });
//   }
// }
