import 'package:flutter/material.dart';

import 'theme_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ThemeProvider themeProvider;

  const CustomAppBar({
    Key? key,
    required this.themeProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Flutter Demo'),
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
