// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TestamentDao? _testamentDaoInstance;

  BookDao? _bookDaoInstance;

  CharpterDao? _charpterDaoInstance;

  VerseDao? _verseDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `testaments` (`id` INTEGER, `testamentName` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `charpters` (`id` INTEGER, `testamentId` INTEGER NOT NULL, `bookId` INTEGER NOT NULL, `charpterNumber` TEXT NOT NULL, `charpterUrl` TEXT NOT NULL, FOREIGN KEY (`testamentId`) REFERENCES `testaments` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`bookId`) REFERENCES `books` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `books` (`id` INTEGER, `testamentId` INTEGER NOT NULL, `bookName` TEXT NOT NULL, `bookUrl` TEXT NOT NULL, FOREIGN KEY (`testamentId`) REFERENCES `testaments` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `verses` (`id` INTEGER, `charpterId` INTEGER NOT NULL, `bookId` INTEGER NOT NULL, `testamentId` INTEGER NOT NULL, `verseNumber` TEXT NOT NULL, `verseText` TEXT NOT NULL, FOREIGN KEY (`testamentId`) REFERENCES `testaments` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`bookId`) REFERENCES `books` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`charpterId`) REFERENCES `charpters` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TestamentDao get testamentDao {
    return _testamentDaoInstance ??= _$TestamentDao(database, changeListener);
  }

  @override
  BookDao get bookDao {
    return _bookDaoInstance ??= _$BookDao(database, changeListener);
  }

  @override
  CharpterDao get charpterDao {
    return _charpterDaoInstance ??= _$CharpterDao(database, changeListener);
  }

  @override
  VerseDao get verseDao {
    return _verseDaoInstance ??= _$VerseDao(database, changeListener);
  }
}

class _$TestamentDao extends TestamentDao {
  _$TestamentDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _testamentModelInsertionAdapter = InsertionAdapter(
            database,
            'testaments',
            (TestamentModel item) => <String, Object?>{
                  'id': item.id,
                  'testamentName': item.testamentName
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TestamentModel> _testamentModelInsertionAdapter;

  @override
  Future<List<TestamentModel>> getAllTestaments() async {
    return _queryAdapter.queryList('SELECT * FROM testaments',
        mapper: (Map<String, Object?> row) => TestamentModel(
            id: row['id'] as int?,
            testamentName: row['testamentName'] as String));
  }

  @override
  Future<TestamentModel?> getById(int id) async {
    return _queryAdapter.query('SELECT * FROM testaments WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TestamentModel(
            id: row['id'] as int?,
            testamentName: row['testamentName'] as String),
        arguments: [id]);
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM testaments WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> deleteTableContent() async {
    await _queryAdapter.queryNoReturn('DELETE FROM testaments');
  }

  @override
  Future<int> insertTestament(TestamentModel testamentModel) {
    return _testamentModelInsertionAdapter.insertAndReturnId(
        testamentModel, OnConflictStrategy.replace);
  }
}

class _$BookDao extends BookDao {
  _$BookDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _bookModelInsertionAdapter = InsertionAdapter(
            database,
            'books',
            (BookModel item) => <String, Object?>{
                  'id': item.id,
                  'testamentId': item.testamentId,
                  'bookName': item.bookName,
                  'bookUrl': item.bookUrl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BookModel> _bookModelInsertionAdapter;

  @override
  Future<List<BookModel>> getAllBooks() async {
    return _queryAdapter.queryList('SELECT * FROM books',
        mapper: (Map<String, Object?> row) => BookModel(
            id: row['id'] as int?,
            bookName: row['bookName'] as String,
            bookUrl: row['bookUrl'] as String,
            testamentId: row['testamentId'] as int));
  }

  @override
  Future<BookModel?> getById(int id) async {
    return _queryAdapter.query('SELECT * FROM books WHERE id = ?1',
        mapper: (Map<String, Object?> row) => BookModel(
            id: row['id'] as int?,
            bookName: row['bookName'] as String,
            bookUrl: row['bookUrl'] as String,
            testamentId: row['testamentId'] as int),
        arguments: [id]);
  }

  @override
  Future<List<BookModel>> getByTestamentId(int testamentId) async {
    return _queryAdapter.queryList('SELECT * FROM books WHERE testamentId = ?1',
        mapper: (Map<String, Object?> row) => BookModel(
            id: row['id'] as int?,
            bookName: row['bookName'] as String,
            bookUrl: row['bookUrl'] as String,
            testamentId: row['testamentId'] as int),
        arguments: [testamentId]);
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM books WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> deleteTableContent() async {
    await _queryAdapter.queryNoReturn('DELETE FROM books');
  }

  @override
  Future<int> insertBook(BookModel book) {
    return _bookModelInsertionAdapter.insertAndReturnId(
        book, OnConflictStrategy.replace);
  }
}

class _$CharpterDao extends CharpterDao {
  _$CharpterDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _charpterModelInsertionAdapter = InsertionAdapter(
            database,
            'charpters',
            (CharpterModel item) => <String, Object?>{
                  'id': item.id,
                  'testamentId': item.testamentId,
                  'bookId': item.bookId,
                  'charpterNumber': item.charpterNumber,
                  'charpterUrl': item.charpterUrl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CharpterModel> _charpterModelInsertionAdapter;

  @override
  Future<List<CharpterModel>> getAllcharpters() async {
    return _queryAdapter.queryList('SELECT * FROM charpters',
        mapper: (Map<String, Object?> row) => CharpterModel(
            id: row['id'] as int?,
            charpterNumber: row['charpterNumber'] as String,
            testamentId: row['testamentId'] as int,
            bookId: row['bookId'] as int,
            charpterUrl: row['charpterUrl'] as String));
  }

  @override
  Future<CharpterModel?> getById(int id) async {
    return _queryAdapter.query('SELECT * FROM charpters WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CharpterModel(
            id: row['id'] as int?,
            charpterNumber: row['charpterNumber'] as String,
            testamentId: row['testamentId'] as int,
            bookId: row['bookId'] as int,
            charpterUrl: row['charpterUrl'] as String),
        arguments: [id]);
  }

  @override
  Future<List<CharpterModel>> getByTestamentId(int testamentId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM charpters WHERE testamentId = ?1',
        mapper: (Map<String, Object?> row) => CharpterModel(
            id: row['id'] as int?,
            charpterNumber: row['charpterNumber'] as String,
            testamentId: row['testamentId'] as int,
            bookId: row['bookId'] as int,
            charpterUrl: row['charpterUrl'] as String),
        arguments: [testamentId]);
  }

  @override
  Future<List<CharpterModel>> getBybookId(int bookId) async {
    return _queryAdapter.queryList('SELECT * FROM charpters WHERE bookId = ?1',
        mapper: (Map<String, Object?> row) => CharpterModel(
            id: row['id'] as int?,
            charpterNumber: row['charpterNumber'] as String,
            testamentId: row['testamentId'] as int,
            bookId: row['bookId'] as int,
            charpterUrl: row['charpterUrl'] as String),
        arguments: [bookId]);
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM charpters WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> deleteTableContent() async {
    await _queryAdapter.queryNoReturn('DELETE FROM charpters');
  }

  @override
  Future<int> insertCharpter(CharpterModel charpterModel) {
    return _charpterModelInsertionAdapter.insertAndReturnId(
        charpterModel, OnConflictStrategy.replace);
  }
}

class _$VerseDao extends VerseDao {
  _$VerseDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _verseModelInsertionAdapter = InsertionAdapter(
            database,
            'verses',
            (VerseModel item) => <String, Object?>{
                  'id': item.id,
                  'charpterId': item.charpterId,
                  'bookId': item.bookId,
                  'testamentId': item.testamentId,
                  'verseNumber': item.verseNumber,
                  'verseText': item.verseText
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<VerseModel> _verseModelInsertionAdapter;

  @override
  Future<List<VerseModel>> getAllverses() async {
    return _queryAdapter.queryList('SELECT * FROM verses',
        mapper: (Map<String, Object?> row) => VerseModel(
            id: row['id'] as int?,
            verseNumber: row['verseNumber'] as String,
            charpterId: row['charpterId'] as int,
            testamentId: row['testamentId'] as int,
            verseText: row['verseText'] as String,
            bookId: row['bookId'] as int));
  }

  @override
  Future<VerseModel?> getById(int id) async {
    return _queryAdapter.query('SELECT * FROM verses WHERE id = ?1',
        mapper: (Map<String, Object?> row) => VerseModel(
            id: row['id'] as int?,
            verseNumber: row['verseNumber'] as String,
            charpterId: row['charpterId'] as int,
            testamentId: row['testamentId'] as int,
            verseText: row['verseText'] as String,
            bookId: row['bookId'] as int),
        arguments: [id]);
  }

  @override
  Future<List<VerseModel>> getByTestamentId(int testamentId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM verses WHERE testamentId = ?1',
        mapper: (Map<String, Object?> row) => VerseModel(
            id: row['id'] as int?,
            verseNumber: row['verseNumber'] as String,
            charpterId: row['charpterId'] as int,
            testamentId: row['testamentId'] as int,
            verseText: row['verseText'] as String,
            bookId: row['bookId'] as int),
        arguments: [testamentId]);
  }

  @override
  Future<List<VerseModel>> getBybookId(int bookId) async {
    return _queryAdapter.queryList('SELECT * FROM verses WHERE bookId = ?1',
        mapper: (Map<String, Object?> row) => VerseModel(
            id: row['id'] as int?,
            verseNumber: row['verseNumber'] as String,
            charpterId: row['charpterId'] as int,
            testamentId: row['testamentId'] as int,
            verseText: row['verseText'] as String,
            bookId: row['bookId'] as int),
        arguments: [bookId]);
  }

  @override
  Future<List<VerseModel>> getBycharpterId(int charpterId) async {
    return _queryAdapter.queryList('SELECT * FROM verses WHERE charpterId = ?1',
        mapper: (Map<String, Object?> row) => VerseModel(
            id: row['id'] as int?,
            verseNumber: row['verseNumber'] as String,
            charpterId: row['charpterId'] as int,
            testamentId: row['testamentId'] as int,
            verseText: row['verseText'] as String,
            bookId: row['bookId'] as int),
        arguments: [charpterId]);
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM verses WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> deleteTableContent() async {
    await _queryAdapter.queryNoReturn('DELETE FROM verses');
  }

  @override
  Future<int> insertVerse(VerseModel verseModel) {
    return _verseModelInsertionAdapter.insertAndReturnId(
        verseModel, OnConflictStrategy.replace);
  }
}
