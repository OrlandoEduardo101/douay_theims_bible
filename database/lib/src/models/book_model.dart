import 'package:database/database.dart';

@Entity(
  tableName: 'books',
  primaryKeys: ['id'],
  foreignKeys: [
    ForeignKey(
      childColumns: ['testamentId'],
      parentColumns: ['id'],
      entity: TestamentModel,
    )
  ],
)
class BookModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @ColumnInfo(name: 'testamentId')
  final int testamentId;

  final String bookName;
  final String bookUrl;

  const BookModel({
    this.id,
    required this.bookName,
    required this.bookUrl,
    required this.testamentId,
  });
}
