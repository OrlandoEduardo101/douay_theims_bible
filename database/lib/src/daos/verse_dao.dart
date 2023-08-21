import 'package:database/database.dart';

@dao
abstract class VerseDao {
  @Query('SELECT * FROM verses')
  Future<List<VerseModel>> getAllverses();

  @Query('SELECT * FROM verses WHERE id = :id')
  Future<VerseModel?> getById(int id);

  @Query('SELECT * FROM verses WHERE testamentId = :testamentId')
  Future<List<VerseModel>> getByTestamentId(int testamentId);

  @Query('SELECT * FROM verses WHERE bookId = :bookId')
  Future<List<VerseModel>> getBybookId(int bookId);

  @Query('SELECT * FROM verses WHERE charpterId = :charpterId')
  Future<List<VerseModel>> getBycharpterId(int charpterId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertVerse(VerseModel verseModel);

  @Query('DELETE FROM verses WHERE id = :id')
  Future<void> deleteById(int id);

  @Query('DELETE FROM verses')
  Future<void> deleteTableContent();
}
