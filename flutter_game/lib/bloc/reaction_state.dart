part of 'reaction_bloc.dart';

abstract class ReactionState extends Equatable {
  const ReactionState();

  @override
  List<Object?> get props => [];
}

class ReactionInitial extends ReactionState {
  const ReactionInitial();
}

class ReactionWaiting extends ReactionState {
  const ReactionWaiting();
}

class ReactionRunning extends ReactionState {
  const ReactionRunning();
}

class ReactionResult extends ReactionState {
  final Duration reactionTime;

  const ReactionResult(this.reactionTime);

  @override
  List<Object?> get props => [reactionTime];
}
