import 'package:database/database.dart';
import 'package:database/src/models/book_model.dart';

@Entity(
  tableName: 'charpters',
  primaryKeys: ['id'],
  foreignKeys: [
    ForeignKey(
      childColumns: ['testamentId'],
      parentColumns: ['id'],
      entity: TestamentModel,
    ),
    ForeignKey(
      childColumns: ['bookId'],
      parentColumns: ['id'],
      entity: BookModel,
    )
  ],
)
class CharpterModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @ColumnInfo(name: 'testamentId')
  final int testamentId;

  @ColumnInfo(name: 'bookId')
  final int bookId;

  final String charpterNumber;
  final String charpterUrl;

  const CharpterModel({
    this.id,
    required this.charpterNumber,
    required this.testamentId,
    required this.bookId,
    required this.charpterUrl,
  });
}
