import 'package:database/database.dart';

@dao
abstract class TestamentDao {
  @Query('SELECT * FROM testaments')
  Future<List<TestamentModel>> getAllTestaments();

  @Query('SELECT * FROM testaments WHERE id = :id')
  Future<TestamentModel?> getById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertTestament(TestamentModel testamentModel);

  @Query('DELETE FROM testaments WHERE id = :id')
  Future<void> deleteById(int id);

  @Query('DELETE FROM testaments')
  Future<void> deleteTableContent();
}
