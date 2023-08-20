import 'package:bible_avm_mobile/modules/testament/testament_entity.dart';

class AppState {
  List<TestamentEntity> testaments;
  AppState({
    required this.testaments,
  });

  AppState copyWith({
    List<TestamentEntity>? testaments,
  }) {
    return AppState(
      testaments: testaments ?? this.testaments,
    );
  }

  factory AppState.empty() => AppState(testaments: const []);
}
