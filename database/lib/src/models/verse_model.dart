import 'package:database/database.dart';

@Entity(
  tableName: 'verses',
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
    ),
    ForeignKey(
      childColumns: ['charpterId'],
      parentColumns: ['id'],
      entity: CharpterModel,
    )
  ],
)
class VerseModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @ColumnInfo(name: 'charpterId')
  final int charpterId;

  @ColumnInfo(name: 'bookId')
  final int bookId;

  @ColumnInfo(name: 'testamentId')
  final int testamentId;

  final String verseNumber;
  final String verseText;

  const VerseModel({
    this.id,
    required this.verseNumber,
    required this.charpterId,
    required this.testamentId,
    required this.verseText,
    required this.bookId,
  });
}
