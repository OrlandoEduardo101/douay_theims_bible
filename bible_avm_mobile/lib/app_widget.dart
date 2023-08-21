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
            title: 'Bíblia Ave Maria',
            theme: themeProvider.currentTheme.copyWith(
                primaryColor: const Color(0xff212121),
                primaryColorDark: const Color(0xff5D4037),
                primaryColorLight: const Color(0xffD7CCC8),
                // textTheme: themeProvider.currentTheme.textTheme.apply(
                //   bodyColor: themeProvider.currentTheme.colorScheme.onBackground,
                // ),
                // textTheme: themeProvider.currentTheme.textTheme.copyWith(
                //   titleMedium: themeProvider.currentTheme.textTheme.titleMedium
                //       ?.copyWith(color: themeProvider.currentTheme.colorScheme.onBackground),
                //   // titleLarge: themeProvider.currentTheme.textTheme.titleMedium
                //   // ?.copyWith(color: themeProvider.currentTheme.colorScheme.onBackground),
                // ),
                colorScheme: themeProvider.currentTheme.colorScheme.copyWith(
                  primary: const Color(0xff212121),
                  secondary: const Color(0xff757575),
                  tertiary: Colors.red,
                )),
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
          );
        });
  }
}
