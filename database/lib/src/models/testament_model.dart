import 'package:floor/floor.dart';

@Entity(
  tableName: 'testaments',
  primaryKeys: ['id'],
)
class TestamentModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String testamentName;

  const TestamentModel({
    this.id,
    required this.testamentName,
  });
}
