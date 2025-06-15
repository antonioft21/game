import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/reaction_bloc.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ReactionGameApp());
}

class ReactionGameApp extends StatelessWidget {
  const ReactionGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reaction Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => ReactionBloc(),
        child: const HomeScreen(),
      ),
    );
  }
}
