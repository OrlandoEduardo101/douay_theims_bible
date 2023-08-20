import 'package:database/database.dart';

import '../models/verse_model.dart';

@dao
abstract class VerseDao {
  @Query('SELECT * FROM verses')
  Future<List<VerseModel>> getAllverses();

  @Query('SELECT * FROM verses WHERE id = :id')
  Future<VerseModel?> getById(int id);

  @Query('SELECT * FROM verses WHERE testamentId = :testamentId')
  Future<VerseModel?> getByTestamentId(int testamentId);

  @Query('SELECT * FROM verses WHERE bookId = :bookId')
  Future<VerseModel?> getBybookId(int bookId);

  @Query('SELECT * FROM verses WHERE charpterId = :charpterId')
  Future<VerseModel?> getBycharpterId(int charpterId);

  @Query('DELETE FROM verses WHERE id = :id')
  Future<void> deleteById(int id);

  @Query('DELETE FROM verses')
  Future<void> deleteTableContent();
}
