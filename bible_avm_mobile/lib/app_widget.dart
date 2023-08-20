import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'theme_provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');
    final ThemeProvider themeProvider = context.read();
    return ValueListenableBuilder<bool>(
        valueListenable: themeProvider.isDarkModeNotifier,
        builder: (context, isDarkMode, child) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            theme: themeProvider.currentTheme,
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
          );
        });
  }
}
