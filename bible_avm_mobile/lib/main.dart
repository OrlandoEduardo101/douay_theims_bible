import 'package:bible_avm_mobile/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

// void main() {
//   runApp(MyApp());
// }

void main() {
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
