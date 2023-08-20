import 'package:database/database.dart';

import '../models/charpter_model.dart';

@dao
abstract class CharpterDao {
  @Query('SELECT * FROM charpters')
  Future<List<CharpterModel>> getAllcharpters();

  @Query('SELECT * FROM charpters WHERE id = :id')
  Future<CharpterModel?> getById(int id);

  @Query('SELECT * FROM charpters WHERE testamentId = :testamentId')
  Future<CharpterModel?> getByTestamentId(int testamentId);

  @Query('SELECT * FROM charpters WHERE bookId = :bookId')
  Future<CharpterModel?> getBybookId(int bookId);

  @Query('DELETE FROM charpters WHERE id = :id')
  Future<void> deleteById(int id);

  @Query('DELETE FROM charpters')
  Future<void> deleteTableContent();
}
