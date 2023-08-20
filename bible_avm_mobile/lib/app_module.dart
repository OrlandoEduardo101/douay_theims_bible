import 'package:bible_avm_mobile/modules/books/books_page.dart';
import 'package:bible_avm_mobile/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'theme_provider.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(ThemeProvider.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
    r.child('/books',
        child: (context) => BooksPage(
              themeProvider: context.read(),
            ));
  }
}
