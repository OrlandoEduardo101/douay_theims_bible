import 'package:database/database.dart';

import '../models/book_model.dart';

@dao
abstract class BookDao {
  @Query('SELECT * FROM books')
  Future<List<BookModel>> getAllBooks();

  @Query('SELECT * FROM books WHERE id = :id')
  Future<BookModel?> getById(int id);

  @Query('SELECT * FROM books WHERE testamentId = :testamentId')
  Future<BookModel?> getByTestamentId(int testamentId);

  @Query('DELETE FROM books WHERE id = :id')
  Future<void> deleteById(int id);

  @Query('DELETE FROM books')
  Future<void> deleteTableContent();
}
