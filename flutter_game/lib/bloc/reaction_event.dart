part of 'reaction_bloc.dart';

abstract class ReactionEvent extends Equatable {
  const ReactionEvent();

  @override
  List<Object?> get props => [];
}

class StartGame extends ReactionEvent {
  const StartGame();
}

class UserTapped extends ReactionEvent {
  const UserTapped();
}

class ResetGame extends ReactionEvent {
  const ResetGame();
}
