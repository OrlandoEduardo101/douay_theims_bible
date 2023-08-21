import 'package:bible_avm_mobile/app_controller.dart';
import 'package:bible_avm_mobile/modules/books/books_controller.dart';
import 'package:bible_avm_mobile/modules/books/books_page.dart';
import 'package:bible_avm_mobile/modules/charpters/charpters_page.dart';
import 'package:bible_avm_mobile/modules/services/database/local_database_service.dart';
import 'package:bible_avm_mobile/modules/services/scraping_service.dart';
import 'package:bible_avm_mobile/modules/splash/splash_controller.dart';
import 'package:bible_avm_mobile/modules/splash/splash_page.dart';
import 'package:bible_avm_mobile/modules/verses/verses_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/services/database/i_local_databse_service.dart';
import 'theme_provider.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    //Theme
    i.addSingleton(ThemeProvider.new);

    //Controllers
    i.addSingleton(AppController.new);
    i.addSingleton(SplashController.new);
    i.addSingleton(BooksController.new);

    //Services
    i.addSingleton<ILocalDatabaseService>(LocalDatabaseService.new);
    i.addSingleton<IScrapingService>(ScrapingService.new);
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => SplashPage(
              splashController: context.read(),
            ));
    r.child('/books',
        child: (context) => BooksPage(
              themeProvider: context.read(),
              appController: context.read(),
              booksController: context.read(),
            ));
    r.child('/charpters',
        child: (context) => CharptersPage(
              themeProvider: context.read(),
              bookEntity: r.args.data,
            ));
    r.child('/verses',
        child: (context) => VersesPage(
              themeProvider: context.read(),
              charptersEntity: r.args.data,
            ));
  }
}
