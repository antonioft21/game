import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/reaction_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reaction Game')),
      body: Center(
        child: BlocBuilder<ReactionBloc, ReactionState>(
          builder: (context, state) {
            if (state is ReactionInitial) {
              return ElevatedButton(
                onPressed: () => context.read<ReactionBloc>().add(const StartGame()),
                child: const Text('Start'),
              );
            } else if (state is ReactionWaiting) {
              return const Text('Wait for green...');
            } else if (state is ReactionRunning) {
              return GestureDetector(
                onTap: () => context.read<ReactionBloc>().add(const UserTapped()),
                child: Container(color: Colors.green, width: 200, height: 200),
              );
            } else if (state is ReactionResult) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Your time: ${state.reactionTime.inMilliseconds} ms'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<ReactionBloc>().add(const ResetGame()),
                    child: const Text('Play Again'),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
