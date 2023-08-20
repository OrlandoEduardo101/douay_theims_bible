import 'package:bible_avm_mobile/app_controller.dart';

import '../services/database/i_local_databse_service.dart';
import '../services/scraping_service.dart';

class SplashController {
  final ILocalDatabaseService localDatabaseService;
  final IScrapingService scrapingService;
  final AppController appController;

  SplashController({required this.localDatabaseService, required this.scrapingService});

  Stream<String> initBooks() async* {
    yield 'Buscando livros...';
    final localTestament = await localDatabaseService.instance.testamentDao.getAllTestaments();

    if (localTestament.isEmpty) {
      
    }
  }
}
