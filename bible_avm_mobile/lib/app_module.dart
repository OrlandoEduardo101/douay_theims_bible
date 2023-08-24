import 'package:bible_avm_mobile/app_controller.dart';
import 'package:bible_avm_mobile/modules/books/books_controller.dart';
import 'package:bible_avm_mobile/modules/books/books_page.dart';
import 'package:bible_avm_mobile/modules/charpters/charpters_page.dart';
import 'package:bible_avm_mobile/modules/services/database/local_database_service.dart';
import 'package:bible_avm_mobile/modules/splash/splash_controller.dart';
import 'package:bible_avm_mobile/modules/splash/splash_page.dart';
import 'package:bible_avm_mobile/modules/verses/verses_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/services/database/i_local_databse_service.dart';
import 'theme_provider.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        //Theme
        Bind((i) => ThemeProvider()),

        //Controllers
        Bind.lazySingleton((i) => AppController()),
        Bind.lazySingleton(
            (i) => SplashController(localDatabaseService: i(), scrapingService: i(), appController: i.get())),
        Bind.lazySingleton((i) => BooksController(i(), i())),

        //Services
        Bind.factory<ILocalDatabaseService>((i) => LocalDatabaseService()),
        Bind.singleton<ILocalDatabaseService>((i) => LocalDatabaseService()),
      ];

  @override
  List<ModularRoute> get routes => {
        ChildRoute('/',
            child: (context, args) => SplashPage(
                  splashController: context.read(),
                )),
        ChildRoute('/books',
            child: (context, args) => BooksPage(
                  themeProvider: context.read(),
                  appController: context.read(),
                  booksController: context.read(),
                )),
        ChildRoute('/charpters',
            child: (context, args) => CharptersPage(
                  themeProvider: context.read(),
                  bookEntity: args.data,
                )),
        ChildRoute('/verses',
            child: (context, args) => VersesPage(
                  themeProvider: context.read(),
                  charptersEntity: args.data,
                )),
      }.toList();
}
