import 'package:bible_avm_mobile/app_state.dart';
import 'package:flutter/foundation.dart';

class AppController extends ValueNotifier<AppState> {
  AppController() : super(AppState.empty());

  void updateState(AppState state) => value = state;
}
