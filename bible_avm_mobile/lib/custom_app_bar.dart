import 'package:flutter/material.dart';

import 'theme_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ThemeProvider themeProvider;
  final String title;

  const CustomAppBar({
    Key? key,
    required this.themeProvider,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        ValueListenableBuilder<bool>(
          valueListenable: themeProvider.isDarkModeNotifier,
          builder: (context, isDarkMode, child) {
            return Switch(
              value: isDarkMode,
              onChanged: (value) {
                themeProvider.isDarkMode = value;
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
