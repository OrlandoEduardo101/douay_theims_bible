import 'package:bible_avm_mobile/app_controller.dart';
import 'package:bible_avm_mobile/app_state.dart';
import 'package:bible_avm_mobile/modules/services/database/i_local_databse_service.dart';

class BooksController {
  final ILocalDatabaseService localDatabaseService;
  final AppController appController;

  BooksController(this.appController, this.localDatabaseService);

  Future<void> clearAll() async {
    await localDatabaseService.instance.verseDao.deleteTableContent();
    await localDatabaseService.instance.charpterDao.deleteTableContent();
    await localDatabaseService.instance.bookDao.deleteTableContent();
    await localDatabaseService.instance.testamentDao.deleteTableContent();
    appController.updateState(AppState.empty());
  }
}
