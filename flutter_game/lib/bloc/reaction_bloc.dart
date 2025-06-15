import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'high_score_cubit.dart';

part 'reaction_event.dart';
part 'reaction_state.dart';

class ReactionBloc extends Bloc<ReactionEvent, ReactionState> {
  final HighScoreCubit highScoreCubit;

  ReactionBloc(this.highScoreCubit) : super(const ReactionInitial()) {
    on<StartGame>(_onStart);
    on<UserTapped>(_onTap);
    on<ResetGame>(_onReset);
  }

  Timer? _timer;
  late DateTime _startTime;

  Future<void> _onStart(StartGame event, Emitter<ReactionState> emit) async {
    emit(const ReactionWaiting());
    final delay = Random().nextInt(2000) + 1000;
    await Future.delayed(Duration(milliseconds: delay));
    _startTime = DateTime.now();
    emit(const ReactionRunning());
  }

  void _onTap(UserTapped event, Emitter<ReactionState> emit) {
    if (state is ReactionRunning) {
      final reactionTime = DateTime.now().difference(_startTime);
      emit(ReactionResult(reactionTime));
      unawaited(highScoreCubit.updateScore(reactionTime));
    }
  }

  void _onReset(ResetGame event, Emitter<ReactionState> emit) {
    _timer?.cancel();
    emit(const ReactionInitial());
  }
}
