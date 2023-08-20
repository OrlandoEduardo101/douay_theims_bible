import 'package:bible_avm_mobile/app_module.dart';
import 'package:bible_avm_mobile/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';
import 'custom_app_bar.dart';

// void main() {
//   runApp(MyApp());
// }

void main() {
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
