import 'package:database/database.dart';
import 'package:flutter/foundation.dart';

import 'i_local_databse_service.dart';

typedef TestamentModelType = TestamentModel;
typedef BookModelType = BookModel;
typedef CharpterModelType = CharpterModel;
typedef VerseModelType = VerseModel;

class LocalDatabaseService implements ILocalDatabaseService {
  late final AppDatabase _instance;
  final ValueNotifier<bool> _isInitialized = ValueNotifier(false);

  LocalDatabaseService() {
    // initalizeDatabase();
  }

  @override
  Future<void> initalizeDatabase() async {
    if (!(_isInitialized.value)) {
      _instance = await $FloorAppDatabase.databaseBuilder('app_database').addMigrations([]).build();
      _isInitialized.value = true;
    }
  }

  @override
  AppDatabase get instance => _instance;

  // final migration2to3 = Migration(2, 3, (database) async {
  //   await database.execute('DROP TABLE IF EXISTS notifications');
  //   await database.execute(
  //     'CREATE TABLE IF NOT EXISTS `notifications` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `messageId` TEXT NOT NULL, `contentID` TEXT NOT NULL, `body` TEXT NOT NULL, `title` TEXT NOT NULL, `dateTime` TEXT NOT NULL, `link` TEXT NOT NULL, `status` INTEGER NOT NULL)',
  //   );
  // });
}
