import 'package:database/database.dart';

abstract class ILocalDatabaseService {
  Future<void> initalizeDatabase();
  AppDatabase get instance;
}
