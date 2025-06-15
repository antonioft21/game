import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HighScoreCubit extends Cubit<Duration?> {
  HighScoreCubit() : super(null) {
    _loadHighScore();
  }

  static const _key = 'high_score_ms';

  Future<void> _loadHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    final ms = prefs.getInt(_key);
    if (ms != null) {
      emit(Duration(milliseconds: ms));
    }
  }

  Future<void> updateScore(Duration newScore) async {
    if (state == null || newScore.inMilliseconds < state!.inMilliseconds) {
      emit(newScore);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_key, newScore.inMilliseconds);
    }
  }
}
