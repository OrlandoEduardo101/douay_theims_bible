import 'package:database/database.dart';

@dao
abstract class BookDao {
  @Query('SELECT * FROM books')
  Future<List<BookModel>> getAllBooks();

  @Query('SELECT * FROM books WHERE id = :id')
  Future<BookModel?> getById(int id);

  @Query('SELECT * FROM books WHERE testamentId = :testamentId')
  Future<List<BookModel>> getByTestamentId(int testamentId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertBook(BookModel book);

  @Query('DELETE FROM books WHERE id = :id')
  Future<void> deleteById(int id);

  @Query('DELETE FROM books')
  Future<void> deleteTableContent();
}
